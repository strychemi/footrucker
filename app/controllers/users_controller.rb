class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_logout, only: [:new]
  before_action :require_current_user, only: [:edit, :update, :dashboard]

  # Signup Page
  def new
    @user = User.new
  end

  # Create User
  def create
    @user = User.new(user_params)
    if @user.save(user_params)
      sign_in(@user)
      flash[:success] = "Created a new User!"
      redirect_to dashboard_path
    else
      flash.now[:danger] = "Failed to create User!"
      render :new
    end
  end

  # User show page
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  # Update user information
  def update
    if current_user.update(user_params)
      flash[:success] = "Success!"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Failed!"
      redirect_to user_path(current_user)
    end
  end

  # Displays dashboard with map
  def dashboard

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
