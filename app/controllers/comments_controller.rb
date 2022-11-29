class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to trip_comments_path(@comment)
    end
  end

  def index
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update

    redirect_to trip_comments_path(@comment)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  # def likes
  # end

  private

  def comment_param
    params.require(:comment).permit(:description, :user_id, :trip_id)
  end
end
