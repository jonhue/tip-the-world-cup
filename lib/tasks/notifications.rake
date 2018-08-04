# frozen_string_literal: true

namespace :notifications do
  desc 'Remind participants of untipped matches that begin in less than a day.'
  task match: :environment do
    Match.soon&.each do |match|
      Participant.includes(:tips)&.each do |participant|
        next if participant.tips.find_by(match: match)
        notification = Notification.create(target: participant.user,
                                           object: match)
        notification.push(
          :OneSignal,
          player_ids: participant.user.onesignal_player_ids,
          url: Rails.application.routes.url_helpers.game_match_url(
            game_id: participant.game.to_param, id: match.to_param
          ),
          contents: {
            en: "#{match.home.name} vs #{match.away.name} will start soon! "\
                "Don't forget to enter your tip for #{participant.game.name}."
          }
        )
      end
    end
  end
end
