class CommentsController < ApplicationController
  def new
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.trip = @trip
    @comment.save!
    if @comment.save
      redirect_to trip_path(@trip)
    end
  end

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
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

  def comment_params
    params.require(:comment).permit(:description, :trip_id)
  end
end
