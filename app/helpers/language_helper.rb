# frozen_string_literal: true

module LanguageHelper
  def current_language
    case I18n.locale.to_s
    when 'en'
      'English'
    when 'de'
      'Deutsch'
    else
      'Choose a language'
    end
  end
end
