class PagesController < ApplicationController

	expose_decorated(:articles) { Article.limit(1) }
	expose_decorated(:news, decorator: NewDecorator, collection: true) { New.limit(3) }
  expose_decorated(:teachers_norway, decorator: AdminDecorator, collection: true) { Admin.all.norway }
  expose_decorated(:teachers_poland, decorator: AdminDecorator, collection: true) { Admin.all.poland }

  def home
  end

  def about
  end
end
