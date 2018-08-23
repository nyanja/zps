# frozen_string_literal: true

class MeowsController < ApplicationController
  if Rails.env.production?
    http_basic_authenticate_with name: "zbs", password: ENV["ZBS_PASSWORD"]
  end
  before_action :set_meow, only: %i[show edit update destroy]

  # GET /meows
  def index
    @meows = Meow.all
  end

  # GET /meows/1
  def show; end

  # GET /meows/new
  def new
    @meow = Meow.new
  end

  # GET /meows/1/edit
  def edit; end

  # POST /meows
  def create
    @meow = Meow.new(meow_params)
    @meow.save!
    attach_image
    @meows = all_meows

    respond_to do |f|
      f.js
    end
  end

  # PATCH/PUT /meows/1
  def update
    if @meow.update(meow_params)
      redirect_to @meow, notice: "Meow was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /meows/1
  def destroy
    @meows = all_meows
    @meow.destroy

    respond_to do |f|
      f.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_meow
    @meow = Meow.find(params[:id])
  end

  def all_meows
    Meow.where(article_id: @meow.article.id)
  end

  # Only allow a trusted parameter "white list" through.
  def meow_params
    params.require(:meow).permit(:title, :content, :url, :meow_type,
                                 :description, :article_id, :image_title,
                                 :image_alt)
  end

  def attach_image
    return unless params[:meow][:image]
    @meow.image.attach(params[:meow][:image])
  end
end
