class PagesController < ApplicationController
  def home
    @article = Article.first
    @news = New.limit(3)
  end

  def about
  end
end
