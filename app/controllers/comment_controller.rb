class CommentController < ApplicationController
  def index
    @immages = Immage.page(params[:page]).per(10)
    render :index
  end

  def create
    Comment.create(body: params[:Comment], picture_id: params[:id])
  end

  def edit
    comment = Comment.find(params[:id], picture_id: params[:id])
    render :edit
  end

  def update
    comment = Comment.find(params[:id], [:id], picture_id: params[:id])
    comment.update(body: params[:body], [:id], picture_id: params[:id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy(params[:id])
  end
end