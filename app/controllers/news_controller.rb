class NewsController < ApplicationController
  def index
    @news = News.all
    render 'index'
  end

  def new
    @news = News.new
  end

  def create 
    @news = News.new(news_params)
    if @news.save
      flash[:success] = "Updating news is successful!!"
      redirect_to @news
    else
      render 'new'
    end
  end

    private
    def news_params
      params.require(:news).permit(:news)
    end
end
