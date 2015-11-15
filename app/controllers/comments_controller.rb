class CommentsController < ApplicationController

  def index
    image = Image.find(params[:image_id])
    if image
      @comments = image.comments
      render "index.json.jbuilder", status: :ok
    else
      render json: { error: "The image you've requested has no comments." },
        status: :not_found
        # status 404
    end
  end

  def create
    image = Image.find(params[:image_id])
    if image && current_user
      @comment = image.comments.create(description: params[:description])
      render "create.json.jbuilder", status: :created
    else
      render json: { error: "The image you've requested does not exist." },
        status: :not_found
        # status 404
    end
  end

  def update
    @comment = Comment.find(params[:comment_id])
    if @comment 
      @comment.update(description: params[:description])
      render "update.json.jbuilder", status: :accepted
      # can't authenticate user because comments don't have a user_id --> needs to be resolved
    else 
      render json: { error: "The comment you've requested does not exist." },
        status: :not_found
        # status 404
    end
  end

  def destroy
    comment = Comment.find(params[:comment_id])
    if comment
      comment.destroy
      render plain: "The comment was deleted successfully."
    else
      render json: { error: "The comment you've requested does not exist." },
        status: :not_found
        # status 404
    end
  end
end