class JourneysController < ApplicationController

  def index
    @journeys = Journey.all
    if @journeys
      render "index.json.jbuilder"
    else
      render json: { error: "There are no journeys to display." }, 
        status: :not_found
          # status 404
    end
  end

  def create
    if current_user
      @journey = Journey.create(title: params[:title],
                                description: params[:description],
                                region: params[:region],
                                photo: params[:photo])
      render "create.json.jbuilder", status: :created 
    else
      render json: { error: "You must be logged in to create a new journey." },
      status: :unauthorized
        # status 404
    end
  end

  def update
    @journey = Journey.find(params[:journey_id])
    if @journey
      @journey.update(title: params[:title],
                      description: params[:description],
                      region: params[:region],
                      photo: params[:photo]
                      user_id: current_user.id)
      render "update.json.jbuilder", status: :accepted
    else
      render json: { error: "The journey you've requested does not exist." },
        status: :not_found
          # status 404
    end
  end

  def show
    @journey = Journey.find(params[:journey_id])
    if @journey
      render "show.json.jbuilder", status: :ok
    else
      render json: { error: "The journey you've requested does not exist." },
        status: :not_found
          # status 404
    end
  end

  def destroy
    journey = current_user.journeys.find(params[:journey_id])
    if journey.user_id = current_user.id
      journey.destroy
      render plain: "The journey has been deleted.", status: :accepted  
    else
      render json: { error: "The journey you've requested does not exist." },
        status: :not_found
          # status 404
    end
  end
end