class ContentsController < ApplicationController
  def index
    @contents = Content.all
    render :index
  end

  def new
    @content = Content.new(user_id: current_user.id)
  end

  def create
    @content = Content.new(content_params)

    if @content.save
      redirect_to contents_path
    else
      render :new
    end
  end

  def content_params
    params.require(:content).permit(:title, :label_type, :description, :user_id)
  end
end
