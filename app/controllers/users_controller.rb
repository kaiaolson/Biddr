class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :change_password, :check_password]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in(@user)
      redirect_to root_path, notice: "Sign up successful!"
    else
      flash[:alert] = "Sign up unsuccessful."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if check_password
      if @user.update user_params
        redirect_to user_path(@user), notice: "Profile updated successfully."
      else
        flash[:notice] = "Profile not updated."
        @changing_password ? (render :change_password) : (render :edit)
      end
    else
      flash[:alert] = "Wrong credentials!"
      @changing_password ? (render :change_password) : (render :edit)
    end
  end

  def change_password
  end

  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find current_user.id
  end

  def check_password
    authentic_password = @user.authenticate(params[:user]["current_password"])
    different_password = params[:user]["current_password"] != params[:user]["password"]
    @changing_password = params[:user]["password"]
    @changing_password ? (authentic_password && different_password) : authentic_password
  end
end
