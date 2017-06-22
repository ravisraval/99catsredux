class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: [:destroy]

  def new
    render :new
  end

  def create
    @new_user = User.find_by_credentials(
    params[:username],
    params[:password]
    )

    if @new_user.nil?
      render json: "Credentials don't ducking exist"
    else
      @new_user.reset_session_token!
      session[:session_token] = @new_user.session_token
      login!(@new_user)
      redirect_to root_url
    end
  end


  def destroy
    current_user.reset_session_token! unless current_user.nil?
    redirect_to root_url
  end



end
