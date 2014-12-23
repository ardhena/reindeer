class ArticlesController < ApplicationController

	expose_decorated(:articles) { Article.all.page(params[:page]).per(3) }
	expose_decorated(:article) { Article.find(params[:id]) }
  expose_decorated(:comments) { article.comments }
  expose(:object) { article.class }

  def index
  end

  def show
  end
end
