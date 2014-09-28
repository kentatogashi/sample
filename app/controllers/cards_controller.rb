class CardsController < ApplicationController
  def index
    logger = Logger.new("/home/vagrant/sample/log/development.log")
    logger.debug(params)
    render 'index'
  end

  def show
  end
end
