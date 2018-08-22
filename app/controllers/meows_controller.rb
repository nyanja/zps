class MeowsController < ApplicationController
  before_action :set_meow, only: [:show, :edit, :update, :destroy]

  # GET /meows
  def index
    @meows = Meow.all
  end

  # GET /meows/1
  def show
  end

  # GET /meows/new
  def new
    @meow = Meow.new
  end

  # GET /meows/1/edit
  def edit
  end

  # POST /meows
  def create
    @meow = Meow.new(meow_params)

    if @meow.save
      redirect_to @meow, notice: 'Meow was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /meows/1
  def update
    if @meow.update(meow_params)
      redirect_to @meow, notice: 'Meow was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /meows/1
  def destroy
    @meow.destroy
    redirect_to meows_url, notice: 'Meow was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meow
      @meow = Meow.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meow_params
      params.require(:meow).permit(:title, :content, :url, :type, :description, :article_id)
    end
end
