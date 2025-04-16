class HomeController < ApplicationController
  def index
  end

  def about
  end

  def projects
  end

  def contact
  end

  def send_message
    name = params[:name]
    email = params[:email]
    message = params[:message]

    # Validate required fields
    if name.blank? || email.blank? || message.blank?
      flash[:alert] = "Vänligen fyll i alla fält."
      redirect_to contact_path
      return
    end

    # Validate email format
    unless email.match?(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
      flash[:alert] = "Vänligen ange en giltig e-postadress."
      redirect_to contact_path
      return
    end

    begin
      ContactMailer.contact_form(name, email, message).deliver_now
      flash[:notice] = "Tack för ditt meddelande! Jag återkommer så snart som möjligt."
    rescue => e
      flash[:alert] = "Ett fel uppstod när meddelandet skulle skickas. Vänligen försök igen senare."
      Rails.logger.error "Failed to send contact form: #{e.message}"
    end

    redirect_to contact_path
  end
end
