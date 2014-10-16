class NewsController < ApplicationController
  def index
    @news = New.all
  end

  def show
  end
end
