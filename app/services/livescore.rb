require 'nokogiri'
require 'open-uri'

class Livescore
  def perform(match:)
    home_goals, away_goals, home_penalties, away_penalties = fetch_livescore(match.home.name, match.away.name)
    return if home_goals.nil? || away_goals.nil?
    match.update_attributes(home_goals: home_goals, away_goals: away_goals, home_penalties: home_penalties, away_penalties: away_penalties)
  end

  private

  def fetch_livescore(home, away)
    doc = Nokogiri::HTML(open(create_google_url(home, away)))
    content = doc.css('div.VewdRc div.eb7Tab > div').first&.content
    goals = content&.split('(')&.first&.split(' - ')
    penalties = content&.split('(')&.last&.tr(')', '')&.split(' - ')
    return goals[0]&.to_i, goals[1]&.to_i, penalties[0]&.to_i, penalties[1]&.to_i
  end

  def create_google_url(home, away)
    "https://www.google.com/search?q=World+Cup+#{home.tr(' ', '+')}+vs+#{away.tr(' ', '+')}"
  end
end
