class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update ]
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Welcome to Alpha Chat #{@user.username}, you have successfully signed up."
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated."
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
