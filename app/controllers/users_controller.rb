class UsersController < ApplicationController
  before_action :redirect_if_logged_in

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to root_url
    else
      render json: @user.errors.full_messages
    end
  end

  private
  def user_params
    params.permit(:username, :password_digest, :session_token, :password)
  end

end
