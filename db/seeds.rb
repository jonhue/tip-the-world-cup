# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

russia = Nation.find_or_create_by!(name: 'Russia')
saudi_arabia = Nation.find_or_create_by!(name: 'Saudi Arabia')
egypt = Nation.find_or_create_by!(name: 'Egypt')
uruguay = Nation.find_or_create_by!(name: 'Uruguay')

portugal = Nation.find_or_create_by!(name: 'Portugal')
spain = Nation.find_or_create_by!(name: 'Spain')
morocco = Nation.find_or_create_by!(name: 'Morocco')
ir_iran = Nation.find_or_create_by!(name: 'IR Iran')

france = Nation.find_or_create_by!(name: 'France')
australia = Nation.find_or_create_by!(name: 'Australia')
peru = Nation.find_or_create_by!(name: 'Peru')
denmark = Nation.find_or_create_by!(name: 'Denmark')

argentina = Nation.find_or_create_by!(name: 'Argentina')
iceland = Nation.find_or_create_by!(name: 'Iceland')
croatia = Nation.find_or_create_by!(name: 'Croatia')
nigeria = Nation.find_or_create_by!(name: 'Nigeria')

brazil = Nation.find_or_create_by!(name: 'Brazil')
switzerland = Nation.find_or_create_by!(name: 'Switzerland')
costa_rica = Nation.find_or_create_by!(name: 'Costa Rica')
serbia = Nation.find_or_create_by!(name: 'Serbia')

germany = Nation.find_or_create_by!(name: 'Germany')
mexico = Nation.find_or_create_by!(name: 'Mexico')
sweden = Nation.find_or_create_by!(name: 'Sweden')
korea_republic = Nation.find_or_create_by!(name: 'Korea Republic')

belgium = Nation.find_or_create_by!(name: 'Belgium')
panama = Nation.find_or_create_by!(name: 'Panama')
tunisia = Nation.find_or_create_by!(name: 'Tunisia')
england = Nation.find_or_create_by!(name: 'England')

poland = Nation.find_or_create_by!(name: 'Poland')
senegal = Nation.find_or_create_by!(name: 'Senegal')
columbia = Nation.find_or_create_by!(name: 'Columbia')
japan = Nation.find_or_create_by!(name: 'Japan')

Nation.all.each do |nation|
  name = nation.name.downcase.gsub(' ', '_')
  nation.flag.attach(io: File.open(Rails.application.root.join('db', 'resources', 'flags', "#{name}.png")), filename: "#{name}.png", content_type: 'image/png') unless nation.flag.attached?
end


Match.find_or_create_by!(home: russia, away: saudi_arabia, begins_at: '14 Jun 2018 - 15:00'.to_datetime)

Match.find_or_create_by!(home: egypt, away: uruguay, begins_at: '15 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: morocco, away: ir_iran, begins_at: '15 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: portugal, away: spain, begins_at: '15 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: france, away: australia, begins_at: '16 Jun 2018 - 10:00'.to_datetime)
Match.find_or_create_by!(home: argentina, away: iceland, begins_at: '16 Jun 2018 - 13:00'.to_datetime)
Match.find_or_create_by!(home: peru, away: denmark, begins_at: '16 Jun 2018 - 16:00'.to_datetime)
Match.find_or_create_by!(home: croatia, away: nigeria, begins_at: '16 Jun 2018 - 19:00'.to_datetime)

Match.find_or_create_by!(home: costa_rica, away: serbia, begins_at: '17 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: germany, away: mexico, begins_at: '17 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: brazil, away: switzerland, begins_at: '17 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: sweden, away: korea_republic, begins_at: '18 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: belgium, away: panama, begins_at: '18 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: tunisia, away: england, begins_at: '18 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: columbia, away: japan, begins_at: '19 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: poland, away: senegal, begins_at: '19 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: russia, away: egypt, begins_at: '19 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: portugal, away: morocco, begins_at: '20 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: uruguay, away: saudi_arabia, begins_at: '20 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: ir_iran, away: spain, begins_at: '20 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: denmark, away: australia, begins_at: '21 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: france, away: peru, begins_at: '21 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: argentina, away: croatia, begins_at: '21 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: brazil, away: costa_rica, begins_at: '22 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: nigeria, away: iceland, begins_at: '22 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: serbia, away: switzerland, begins_at: '22 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: belgium, away: tunisia, begins_at: '23 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: korea_republic, away: mexico, begins_at: '23 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: germany, away: sweden, begins_at: '23 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: england, away: panama, begins_at: '24 Jun 2018 - 12:00'.to_datetime)
Match.find_or_create_by!(home: japan, away: senegal, begins_at: '24 Jun 2018 - 15:00'.to_datetime)
Match.find_or_create_by!(home: poland, away: columbia, begins_at: '24 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: uruguay, away: russia, begins_at: '25 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: saudi_arabia, away: egypt, begins_at: '25 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: spain, away: morocco, begins_at: '25 Jun 2018 - 18:00'.to_datetime)
Match.find_or_create_by!(home: ir_iran, away: portugal, begins_at: '25 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: australia, away: peru, begins_at: '26 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: denmark, away: france, begins_at: '26 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: nigeria, away: argentina, begins_at: '26 Jun 2018 - 18:00'.to_datetime)
Match.find_or_create_by!(home: iceland, away: croatia, begins_at: '26 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: korea_republic, away: germany, begins_at: '27 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: mexico, away: sweden, begins_at: '27 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: serbia, away: brazil, begins_at: '27 Jun 2018 - 18:00'.to_datetime)
Match.find_or_create_by!(home: switzerland, away: costa_rica, begins_at: '27 Jun 2018 - 18:00'.to_datetime)

Match.find_or_create_by!(home: japan, away: poland, begins_at: '28 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '28 Jun 2018 - 14:00'.to_datetime)
Match.find_or_create_by!(home: panama, away: tunisia, begins_at: '28 Jun 2018 - 18:00'.to_datetime)
Match.find_or_create_by!(home: england, away: belgium, begins_at: '28 Jun 2018 - 18:00'.to_datetime)

# Match.find_or_create_by!(home: japan, away: poland, begins_at: '30 Jun 2018 - 15:00'.to_datetime)
# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '30 Jun 2018 - 19:00'.to_datetime)
#
# Match.find_or_create_by!(home: japan, away: poland, begins_at: '1 Jul 2018 - 15:00'.to_datetime)
# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '1 Jul 2018 - 19:00'.to_datetime)
#
# Match.find_or_create_by!(home: japan, away: poland, begins_at: '2 Jul 2018 - 15:00'.to_datetime)
# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '2 Jul 2018 - 19:00'.to_datetime)
#
# Match.find_or_create_by!(home: japan, away: poland, begins_at: '3 Jul 2018 - 15:00'.to_datetime)
# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '3 Jul 2018 - 19:00'.to_datetime)
#
# Match.find_or_create_by!(home: japan, away: poland, begins_at: '6 Jul 2018 - 15:00'.to_datetime)
# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '6 Jul 2018 - 19:00'.to_datetime)
#
# Match.find_or_create_by!(home: japan, away: poland, begins_at: '7 Jul 2018 - 16:00'.to_datetime)
# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '7 Jul 2018 - 19:00'.to_datetime)

# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '10 Jul 2018 - 19:00'.to_datetime)

# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '11 Jul 2018 - 19:00'.to_datetime)

# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '14 Jul 2018 - 15:00'.to_datetime)

# Match.find_or_create_by!(home: senegal, away: columbia, begins_at: '15 Jul 2018 - 16:00'.to_datetime)
