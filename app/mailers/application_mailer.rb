# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'app@tip-the-world-cup.com'
  layout 'mailer'
end
