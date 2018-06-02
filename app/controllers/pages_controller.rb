class PagesController < ApplicationController
  def home
    fetch_categories
  end

  def article
    @article = Article.find_by_slug(params[:slug])
    return not_found unless @article
    fetch_categories
    @title = @article.title
    @meta_description = @article.description
    @meta_keywords = @article.keywords
    @article.update views_count: @article.views_count.succ
  end
end
