class SessionsController < ApplicationController
  layout "home"

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.password == params[:password]
      # Does the logging in
      session["current_user_id"] = @user.id

      redirect_to contents_path
    else
      @message = "Go AWAY!"
      render :new
    end
  end

  def destroy
    session.delete("current_user_id")
    redirect_to root_path
  end
end
