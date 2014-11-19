class ArticlesController < ApplicationController

	expose(:articles)

  def index
  	@articles = articles
  end

  def show
  end
end
