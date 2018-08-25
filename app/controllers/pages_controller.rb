# frozen_string_literal: true

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
    @article.update_columns views_count: @article.views_count.succ
    @meows = @article.meows.map { |m| [m.id, m] }.to_h
  end

  def category
    @category = Category.find_by_slug(params[:slug])
    return not_found unless @category
    @title = @description = @category.name
  end

  def home
    @articles = Article.all.limit(40)
  end

  def admin; end
end
