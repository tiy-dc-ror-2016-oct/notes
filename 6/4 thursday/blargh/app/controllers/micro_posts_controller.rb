class MicroPostsController < ApplicationController
  def index
    @micro_posts = MicroPost.all
    render :index
  end

  def new
    @micro_post = MicroPost.new(user_id: current_user.id)
  end

  def create
    @micro_post = MicroPost.new(micro_post_params)

    if @micro_post.save
      redirect_to "/micro_posts"
    else
      render :new
    end
  end

  def edit
    @micro_post = MicroPost.find(params["id"])
  end

  def update
    @micro_post = MicroPost.find(params["id"])
    if @micro_post.update(micro_post_params)
      redirect micro_posts_path
    else
      render :edit
    end
  end

  def destroy
    @micro_post = MicroPost.find(params["id"])
    @micro_post.destroy
    redirect_to micro_posts_path
  end




  def download
    @micro_post = MicroPost.find(params["id"])

    render json: @micro_post
  end


  def micro_post_params
    params.require(:micro_post).permit(:title, :content, :user_id)
  end
end
