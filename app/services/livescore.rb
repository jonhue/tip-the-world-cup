require 'nokogiri'
require 'open-uri'

class Livescore
  def perform(match:)
    home_goals, away_goals, home_penalties, away_penalties, finished = fetch_livescore(match.home.name, match.away.name)
    return if home_goals.nil? || away_goals.nil?
    match.update_attributes(home_goals: home_goals, away_goals: away_goals, home_penalties: home_penalties, away_penalties: away_penalties, finished: finished)
  end

  private

  def fetch_livescore(home, away)
    arr = []
    doc = Nokogiri::HTML(open(create_google_url(home, away)))
    query = doc.css('div.VewdRc div.eb7Tab > div')
    content = query.first&.content
    finished = query.last&.content == 'Final'
    if goals = content&.split('(')&.first&.split(' - ')
      arr << goals[0]&.to_i
      arr << goals[1]&.to_i
    end
    if content&.split('(')&.length == 2 && penalties = content&.split('(')&.last&.tr(')', '')&.split(' - ')
      arr << penalties[0]&.to_i
      arr << penalties[1]&.to_i
    end
    arr << finished
    arr
  end

  def create_google_url(home, away)
    "https://www.google.com/search?q=World+Cup+#{home.tr(' ', '+')}+vs+#{away.tr(' ', '+')}"
  end
end
