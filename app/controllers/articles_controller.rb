class ArticlesController < ApplicationController

	expose_decorated(:articles) { Article.all.page(params[:page]).per(3) }
	expose_decorated(:article) { Article.find(params[:id]) }
  expose_decorated(:comments) { article.comments }
  expose_decorated(:new_comment, decorator: CommentDecorator) { article.comments.new }

  def index
  end

  def show
  end
end
