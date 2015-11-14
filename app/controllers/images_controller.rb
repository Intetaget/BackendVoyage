class ImagesController < ApplicationController
  def index
  end

  def create
    journey = Journey.find(params[:journey_id])
    @image = journey.images.new
    @image.photo = params[:photo]
    @image.save
    render "create.json.jbuilder", status: :created
  end

  def show
  end

  def delete
  end
end
