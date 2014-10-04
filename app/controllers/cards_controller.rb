class CardsController < ApplicationController
  def index
    @card = Firm.where(:parse_string  => params[:parse_string])
    logger = Logger.new("/home/vagrant/sample/log/development.log")
    logger.debug(@card)
    render 'index', :layout => false
  end

  def show
  end
end
