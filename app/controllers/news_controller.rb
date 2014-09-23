class NewsController < ApplicationController
  def index
    @news = News.all
    render 'index'
  end
end
