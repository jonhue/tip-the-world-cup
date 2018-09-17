# frozen_string_literal: true

require 'nokogiri'

class Livescore
  def initialize(match:)
    @match = match
  end

  def perform
    livescore = fetch_livescore
    return if livescore[:home_goals].nil? || livescore[:away_goals].nil?

    match.update_attributes(livescore)
  end

  private

  def fetch_livescore
    @page = parse_page

    home_goals, away_goals = goals
    home_penalties, away_penalties = penalties

    results(finished?, home_goals, away_goals, home_penalties, away_penalties)
  end

  def parse_page
    doc = Nokogiri::HTML(
      HTTParty.get(create_google_url(@match.home.name, @match.away.name)).body
    )
    doc.css('div.VewdRc div.eb7Tab > div')
  end

  def data
    @page.first&.content
  end

  def finished?
    @page.last&.content == 'Final'
  end

  def goals
    goal_data = data&.split('(')&.first&.split(' - ')
    return unless goal_data

    [goal_data[0]&.to_i, goal_data[1]&.to_i]
  end

  def penalties
    return unless data&.split('(')&.length == 2

    penalty_data = data&.split('(')&.last&.tr(')', '')&.split(' - ')
    return unless penalty_data

    [penalty_data[0]&.to_i, penalty_data[1]&.to_i]
  end

  def results(finished, home_goals, away_goals, home_penalties, away_penalties)
    {
      finished: finished,
      home_goals: home_goals,
      away_goals: away_goals,
      home_penalties: home_penalties,
      away_penalties: away_penalties
    }
  end

  def create_google_url(home, away)
    'https://www.google.com/search?q=World+Cup+'\
    "#{home.tr(' ', '+')}+vs+#{away.tr(' ', '+')}"
  end
end
