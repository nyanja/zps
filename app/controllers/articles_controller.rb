# frozen_string_literal: true

class ArticlesController < ApplicationController
  if Rails.env.production?
    http_basic_authenticate_with name: "zbs", password: ENV["ZBS_PASSWORD"]
  end
  before_action :set_article, only: %i[show edit update destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @meows = @article.meows.map { |m| [m.id, m] }.to_h
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      attach_image
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      attach_image
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def article_params
    params.require(:article).permit(:name, :slug, :preview, :content, :title,
                                    :description, :keywords, { tag_ids: [] },
                                    :category_id, :time_to_read)
  end

  def attach_image
    return unless params[:article][:image]
    @article.image.attach(params[:article][:image])
  end
end
