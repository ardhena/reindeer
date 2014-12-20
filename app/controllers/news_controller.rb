class NewsController < ApplicationController

	expose_decorated(:news, decorator: NewDecorator, collection: true) {
    New.all.page(params[:page]).per(5) }
	expose_decorated(:new, decorator: NewDecorator, collection: false) { New.find(params[:id]) }

  def index
  end

  def show
  end
end
