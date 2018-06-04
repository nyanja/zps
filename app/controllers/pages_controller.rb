class PagesController < ApplicationController
  def home
    fetch_categories

    @categories = Category.all
  end

  def article
    fetch_categories

    @article = Article.find_by_slug(params[:slug])
    return not_found unless @article
    @title = @article.title
    @meta_description = @article.description
    @meta_keywords = @article.keywords
    @article.update views_count: @article.views_count.succ
  end

  def category
    fetch_categories

    @category = Category.find_by_slug(params[:slug])
    return not_found unless @category
    @title = @description = @category.name
  end
end
