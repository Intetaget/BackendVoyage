class JourneysController < ApplicationController

  def index
    @journeys = current_user.journeys
    if @journeys
      render "index.json.jbuilder"
    else
      render json: { error: "#{current_user.username} has no journeys to display." }, 
        status: :not_found
          # status 404
    end
  end

  def create
    if current_user
      @journey = current_user.journeys.create(title: params[:title],
                                              description: params[:description],
                                              region: params[:region])
      render "create.json.jbuilder", status: :created 
    else
      render json: { error: "You must be logged in to create a new journey." },
      status: :unauthorized
        # status 404
    end
  end

  def update
    @journey = current_user.journeys.find(params[:journey_id])
    if @journey
      @journey.update(title: params[:title],
                      description: params[:description],
                      region: params[:region])
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
    if journey
      journey.destroy
      render plain: "The journey has been deleted.", status: :accepted  
    else
      render json: { error: "The journey you've requested does not exist." },
        status: :not_found
          # status 404
    end
  end
end