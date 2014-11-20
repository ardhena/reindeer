class NewsController < ApplicationController
  
	expose_decorated(:news, decorator: NewDecorator, collection: true) { New.all }

  def index
  end

  def show
  end
end
