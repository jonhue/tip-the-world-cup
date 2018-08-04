# frozen_string_literal: true

module WelcomeHelper
  def welcome_subtitle
    if Date.today < Match.all.order(:begins_at).first.begins_at
      'Start tipping before the 16th of June.'
    else
      'The tournament has already begun.'
    end
  end
end
