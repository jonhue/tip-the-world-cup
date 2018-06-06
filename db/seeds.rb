# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

response = HTTParty.get('https://raw.githubusercontent.com/jonhue/fifa-worldcup-2018/master/data.json')
nations = JSON.parse(response.body)&.dig('teams')
groups = JSON.parse(response.body)&.dig('groups')
knockout = JSON.parse(response.body)&.dig('knockout')

nations&.each do |nation|
  Nation.find_or_create_by!(id: nation['id'], name: nation['name'])
end

Nation.all.each do |nation|
  name = nation.name.downcase.gsub(' ', '_')
  nation.flag.attach(io: File.open(Rails.application.root.join('db', 'resources', 'flags', "#{name}.png")), filename: "#{name}.png", content_type: 'image/png') unless nation.flag.attached?
end

groups&.each do |_, group|
  group['matches']&.each do |match|
    Match.find_or_create_by!(home_id: match['home_team'], away_id: match['away_team'], begins_at: match['date'].to_datetime).update_attributes(home_goals: match['home_result'], away_goals: match['away_result'], finished: match['finished'])
  end
end

knockout&.each do |_, round|
  round['matches']&.each do |match|
    if match['home_team']&.is_a?(Integer) && match['away_team']&.is_a?(Integer)
      Match.find_or_create_by!(home_id: match['home_team'], away_id: match['away_team'], begins_at: match['date'].to_datetime).update_attributes(home_goals: match['home_result'], away_goals: match['away_result'], finished: match['finished'])
    end
  end
end
