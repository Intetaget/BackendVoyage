class RegistrationsController < ApplicationController

  def create
    @user = User.new(username: params[:username],
                     full_name: params[:full_name],
                     email: params[:email],
                     password: params[:password])
    if @user.save
      render "create.json.jbuilder", status: :created
      # render json: { user: @user }, status: :ok
        # status: 201
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
        # status: 422
    end
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      render "login.json.jbuilder", status: :ok
      # render json: { user: @user }, status: :ok
    else
      render json: { error: "Could not find user for #{params[:username]} or wrong password." },
        status: :unauthorized
    end
  end

  def destroy
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.destroy
      head :no_content
    else
      render json: { error: "Invalid email (#{params[:email]}) or password." },
        status: :unauthorized
    end
  end

  # def user_params
  #   params.require(:user).permit(:username, :full_name, :email, :password)
  # end
end