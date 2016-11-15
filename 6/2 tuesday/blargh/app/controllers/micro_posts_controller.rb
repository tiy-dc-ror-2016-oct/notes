class MicroPostsController < ApplicationController
  def index
    @micro_posts = MicroPost.all
    render :index
  end

  def new
    @micro_post = MicroPost.new
  end

  def create
    @micro_post = MicroPost.new(micro_post_params)

    if @micro_post.save
      redirect_to "/micro_posts"
    else
      render :new
    end
  end

  def micro_post_params
    params.require(:micro_post).permit(:title, :content, :author_id)
  end
end
