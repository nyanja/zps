class PagesController < ApplicationController
  before_action :fetch_categories

  def catalog
    @categories = Category.all
  end

  def article
    @article = Article.find_by_slug(params[:slug])
    return not_found unless @article
    @title = @article.title
    @meta_description = @article.description
    @meta_keywords = @article.keywords
    @article.update views_count: @article.views_count.succ
  end

  def category
    @category = Category.find_by_slug(params[:slug])
    return not_found unless @category
    @title = @description = @category.name
  end

  def admin; end
end
