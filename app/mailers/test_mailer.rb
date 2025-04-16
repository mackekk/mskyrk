class TestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.test_email.subject
  #
  default from: ENV['GMAIL_USERNAME']

  def test_email
    @greeting = "Hi"
    mail(
      to: ENV['GMAIL_USERNAME'],
      subject: 'Test Email from Rails App'
    )
  end
end
