class CardsController < ApplicationController
  def index
    @card = Firm.where(:parse_string  => params[:parse_string])

    if Rails.env.development?
      logger = Logger.new("/home/vagrant/sample/log/development.log")
      logger.debug(@card)
    end

    unless @card.exists?
      redirect_to root_path
      return
    end
    
    render 'index', :layout => false
  end

  def show
  end
end
