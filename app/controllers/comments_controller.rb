class CommentsController < ApplicationController

  def index
    image = Image.find(params[:image_id])
    @comments = image.comments
    render :index
  end

  def create
    image = Image.find(params[:image_id])
    if image
      @comment = image.comments.create(description: params[:description])
      render "create.json.jbuilder", status: :created
        # status 201
    else
      render json: { error: "The image you've requested does not exist." },
        status: :not_found
          # status 404
    end
  end

  # def edit
  #   comment = Comment.find(:params[picture_id])
  #   render :edit
  # end

  # def update
  #   comment = Comment.find(params[:id], picture_id: params[:id])
  #   comment.update(body: params[:body], [:id], picture_id: params[:id])
  # end

  # def destroy
  #   comment = Comment.find(params[:id])
  #   comment.destroy(params[:id])
  # end
end