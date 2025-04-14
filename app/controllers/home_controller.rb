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
    # TODO: Implement email sending logic
    flash[:notice] = "Tack för ditt meddelande! Jag återkommer så snart som möjligt."
    redirect_to contact_path
  end
end
