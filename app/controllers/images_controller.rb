class ImagesController < ApplicationController
  def index
    journey = Journey.find(params[:journey_id])
    @images = journey.images
    if @images
      render "index.json.jbuilder", status: :ok
    else
      render json: { error: "There are no images to display for this journey." },
        status: :not_found
        # status 404
    end
  end

  def create
    journey = Journey.find(params[:journey_id])
    @image = journey.images.new
    @image.photo = params[:photo]
    if @image.save
      render "create.json.jbuilder", status: :created
    else
      render json: { error: "You are not authorized to add an image to this journey." },
        status: :unauthorized
          # status 401
    end
  end

  def show
    @image = Image.find(params[:image_id])
    if @image
      render "show.json.jbuilder", status: :ok
    else
      render json: { error: "The image you've requested does not exist." },
        status: :not_found
          # status 404
    end
  end

  def destroy
    image = Image.find(params[:image_id])
    journey = Journey.find_by(id: image.journey_id)
    if journey.user_id == current_user.id
      image.destroy
      render plain: "The image has been deleted successfully."
    else
      render json: { error: "You're not authorized to delete this image." },
        status: :unauthorized
          # status 401
    end
  end
end
