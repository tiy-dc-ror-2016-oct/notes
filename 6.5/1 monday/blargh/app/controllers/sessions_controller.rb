class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.password == params[:password]
      # Does the logging in
      session["current_user_id"] = @user.id

      redirect_to micro_posts_path
    else
      @message = "Go AWAY dingus!!!!!"
      render :new
    end
  end

  def destroy
    session.delete("current_user_id")
    redirect_to micro_posts_path
  end
end
