class NewsController < ApplicationController
  
	expose(:news) { New.all }

  def index
  end

  def show
  end
end
