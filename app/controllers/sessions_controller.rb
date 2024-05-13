class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session] [:email].downcase)
    if user && user.authenticate(params[:session] [:password])
      session[:user_id] = user.id #Tracking Authenticating the user with session method/object while they logged in until they logout using destroy action. 
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was something wrong with your login details"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
