class PagesController < ApplicationController
  def home
  end

  def article
    @article = Article.find_by_slug(params[:slug])
    return not_found unless @article
    @title = @article.title
    @meta_description = @article.description
    @meta_keywords = @article.keywords
  end
end
