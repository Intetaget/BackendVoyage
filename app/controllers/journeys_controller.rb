class JourneysController < ApplicationController
  def create
    @journey = current_user.journeys.create(title: params[:title],
                                            description: params[:description],
                                            region: params[:region])
    render "create.json.jbuilder", status: :created  
  end
end