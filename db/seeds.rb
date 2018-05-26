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
