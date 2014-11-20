class ArticlesController < ApplicationController

	expose_decorated(:articles)
	expose_decorated(:article) { Article.find(params[:id]) }

  def index
  end

  def show
  end
end
