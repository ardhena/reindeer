class NewsController < ApplicationController
  
	expose(:news)

  def index
    @news = news
  end

  def show
  end
end
