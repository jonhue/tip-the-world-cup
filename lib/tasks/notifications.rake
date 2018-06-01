namespace :notifications do
  desc "Remind participants of untipped matches that begin in less than a day."
  task match: :environment do
    matches = Match.future.where('begins_at < ?', (Rails.env.production? ? DateTime.tomorrow.strftime('%Y-%m-%d %H:%M:%S') : DateTime.tomorrow.strftime('%Y-%d-%m %H:%M:%S')))
    matches&.each do |match|
      participants = Participant.includes(:tips).where.not(tips: { match_id: match.id })
      participants&.each do |participant|
        notification = Notification.create(target: participant.user, object: match)
        notification.push :OneSignal, player_ids: user.onesignal_player_ids, url: Rails.application.routes.url_helpers.game_match_url(game_id: participant.game.to_param, id: match.to_param), contents: {
            en: "#{match.home.name} vs #{match.away.name} will soon start! Don't forget to enter your tip for #{participant.game.name}."
        }
      end
    end
  end
end
