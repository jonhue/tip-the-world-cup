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
      response = HTTParty.get('https://raw.githubusercontent.com/lsv/fifa-worldcup-2018/master/data.json')
      JSON.parse(response.body)&.dig('teams')
    end

    def find_or_create_nations(nations)
      nations.each do |nation|
        ::Nation.find_or_create_by!(id: nation['id'], name: nation['name'])
      end
    end

    def attach_flags_to_nations
      ::Nation.all.each do |nation|
        name = nation.name.downcase.gsub(' ', '_')
        next if nation.flag.attached?
        nation.flag.attach(io: File.open(Rails.application.root.join('db', 'resources', 'flags', "#{name}.png")), filename: "#{name}.png", content_type: 'image/png')
      end
    end
  end
end
