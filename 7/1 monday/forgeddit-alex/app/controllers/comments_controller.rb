class CommentsController < ApplicationController
  def index
    @comments = Comment.where(content_id: params["content_id"])
    render :index
  end

  def new
    @content = Content.find_by(id: params["content_id"])
    @comment = Comment.new(user_id: current_user.id, content_id: @content.id)
  end

  def create
    @content = Content.find_by(id: params["content_id"])
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to content_comments_path
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:user_id, :content_id, :user_comment)
  end
end
