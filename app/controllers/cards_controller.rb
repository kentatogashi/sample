class CardsController < ApplicationController
  def index
    @card = Firm.where(:parse_string  => params[:parse_string])

    if Rails.env.developement?
      logger = Logger.new("/home/vagrant/sample/log/development.log")
      logger.debug(@card)
    end
    
    render 'index', :layout => false
  end

  def show
  end
end
