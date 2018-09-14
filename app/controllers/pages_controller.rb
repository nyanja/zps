# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :fetch_categories

  def catalog
    @categories = Category.all
  end

  def article
    @category = Category.find_by_slug(params[:category_slug])
    return not_found unless @category
    @article = @category.articles.find_by_slug(params[:slug])
    return not_found unless @article
    @title = @article.title
    @meta_description = @article.description
    @meta_keywords = @article.keywords
    @article.update_columns views_count: @article.views_count.succ
    @meows = @article.meows.map { |m| [m.id, m] }.to_h
  end

  def category
    @category = Category.find_by_slug(params[:slug])
    # TODO
    unless @category
      if (article = Article.find_by_slug(params[:slug]))
        return redirect_to article_page_path(article.param)
      else
        return not_found
      end
    end
    @articles = @category.articles
    @title = @description = @category.name
  end

  def home
    @articles = Article.all.limit(40)
  end

  def admin; end
end
