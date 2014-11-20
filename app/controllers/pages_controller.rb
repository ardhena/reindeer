class PagesController < ApplicationController

	expose_decorated(:articles) { Article.limit(1) }
	expose_decorated(:news, decorator: NewDecorator, collection: true) { New.limit(3) }

  def home
  end

  def about
  end
end
