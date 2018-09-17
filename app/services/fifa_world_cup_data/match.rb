# frozen_string_literal: true

module FifaWorldCupData
  class Match
    def perform
      matches = fetch_matches
      return unless matches.any?

      find_or_create_matches(matches)
    end

    private

    def fetch_matches
      response = HTTParty.get(data_url)
      groups = JSON.parse(response.body)&.dig('groups')
      knockout = JSON.parse(response.body)&.dig('knockout')

      groups.merge(knockout)
    end

    def find_or_create_matches(matches)
      matches.each do |_, data|
        data['matches']&.each do |match|
          find_or_create_match(match)
        end
      end
    end

    def find_or_create_match(match)
      return unless match_valid?(match)

      match = ::Match.find_or_create_by!(find_or_create_hash(match))
      return unless match_updated?(match)

      match.update!(update_hash(match))
    end

    def match_valid?(match)
      match.key?('home_team') &&
        match.key?('away_team') &&
        match['home_team'].is_a?(Integer) &&
        match['away_team'].is_a?(Integer) &&
        match['home_team'] < 33 &&
        match['away_team'] < 33
    end

    def match_updated?(match)
      match['home_result'] && match['away_result']
    end

    def find_or_create_hash(match)
      {
        home_id: match['home_team'],
        away_id: match['away_team'],
        begins_at: match['date'].to_datetime
      }
    end

    def update_hash(match)
      {
        finished: match['finished'],
        home_goals: match['home_result'],
        away_goals: match['away_result'],
        home_penalties: match['home_penalty'],
        away_penalties: match['away_penalty']
      }
    end

    def data_url
      'https://raw.githubusercontent.com/lsv/fifa-worldcup-2018/master/'\
      'data.json'
    end
  end
end
