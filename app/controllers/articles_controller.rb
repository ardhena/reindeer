class ArticlesController < ApplicationController

	expose_decorated(:articles) { Article.all.page(params[:page]).per(5) }
	expose_decorated(:article) { Article.find(params[:id]) }

  def index
  end

  def show
  end
end
