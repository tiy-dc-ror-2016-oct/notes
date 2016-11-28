class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    session["message"] = "you signed up!"
    if @user.save
      redirect_to micro_posts_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :password)
  end
end
