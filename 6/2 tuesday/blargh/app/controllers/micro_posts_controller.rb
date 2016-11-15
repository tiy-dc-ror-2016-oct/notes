class MicroPostsController < ApplicationController
  def index
    github = open("https://api.github.com/users/#{params[:github_login]}")
    @github_user = JSON.parse(github.read)
    render :index
  end
end
