class PagesController < ApplicationController
  def home
    @articles = Article.all
  end

  def news
  end

  def articles
  end

  def about
  end
end
