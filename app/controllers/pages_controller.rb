class PagesController < ApplicationController
  def home
    @articles = Article.limit(1)
    @news = New.limit(3)
  end

  def about
  end
end
