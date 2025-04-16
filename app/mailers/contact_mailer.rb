class ContactMailer < ApplicationMailer
  default from: ENV['GMAIL_USERNAME']

  def contact_form(name, email, message)
    @name = name
    @email = email
    @message = message

    mail(
      to: ENV['GMAIL_USERNAME'],
      subject: "New Contact Form Submission from #{@name}"
    )
  end
end 