class PagesController < ApplicationController

	expose(:articles) { Article.limit(1) }
	expose(:news) { New.limit(3) }

  def home
  end

  def about
  end
end
