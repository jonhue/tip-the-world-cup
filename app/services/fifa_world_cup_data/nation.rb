# frozen_string_literal: true

module FifaWorldCupData
  class Nation
    def perform
      nations = fetch_nations
      return unless nations.any?

      find_or_create_nations(nations)
      attach_flags_to_nations
    end

    private

    def fetch_nations
      response = HTTParty.get(data_url)
      JSON.parse(response.body)&.dig('teams')
    end

    def find_or_create_nations(nations)
      nations.each do |nation|
        ::Nation.find_or_create_by!(id: nation['id'], name: nation['name'])
      end
    end

    def attach_flags_to_nations
      ::Nation.all.each do |nation|
        next if nation.flag.attached?

        name = nation.name.downcase.tr(' ', '_')
        nation.flag.attach(
          io: flag_for(name),
          filename: "#{name}.png",
          content_type: 'image/png'
        )
      end
    end

    def flag_for(name)
      File.open(
        Rails.application.root.join('db', 'resources', 'flags', "#{name}.png")
      )
    end

    def data_url
      'https://raw.githubusercontent.com/lsv/fifa-worldcup-2018/master/'\
      'data.json'
    end
  end
end
