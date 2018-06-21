class CommentsController < ApplicationController
  if Rails.env.production?
    http_basic_authenticate_with name: 'zbs', password: ENV['ZBS_PASSWORD']
  end
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    attach_image if @comment.save!
    @comments = all_comments

    respond_to do |f|
      f.js
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to edit_article_path(@comment.article)
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comments = all_comments
    @comment.destroy

    respond_to do |f|
      f.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def all_comments
    Comment.where(article_id: @comment.article_id)
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:content, :article_id, :username)
  end

  def attach_image
    if (image = params[:comment][:avatar])
      @comment.avatar.attach(image)
    end
  end

end
