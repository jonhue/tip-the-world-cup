module FifaWorldCupData
  class Match
    def perform
      matches = fetch_matches
      return unless matches[0].any? && matches[1].any?
      find_or_create_matches(matches)
    end

    private

    def fetch_matches
      response = HTTParty.get('https://raw.githubusercontent.com/lsv/fifa-worldcup-2018/master/data.json')
      return JSON.parse(response.body)&.dig('groups'), JSON.parse(response.body)&.dig('knockout')
    end

    def find_or_create_matches(matches)
      matches.each do |a|
        a.each do |_, b|
          b['matches']&.each do |match|
            if match['home_team']&.is_a?(Integer) && match['away_team']&.is_a?(Integer) && match['home_team'] < 33 && match['away_team'] < 33
              match = ::Match.find_or_create_by!(home_id: match['home_team'], away_id: match['away_team'], begins_at: match['date'].to_datetime)
              match.update_attributes(home_goals: match['home_result'], away_goals: match['away_result'], home_penalties: match['home_penalty'], away_penalties: match['away_penalty'], finished: match['finished']) if match['home_result'] && match['away_result']
            end
          end
        end
      end
    end
  end
end
