class PagesController < ApplicationController

	expose(:articles) { Article.limit(1) }
	expose(:news) { New.limit(3) }

  def home
    @articles = articles
    @news = news
  end

  def about
  end
end
