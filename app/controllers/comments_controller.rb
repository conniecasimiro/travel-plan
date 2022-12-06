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
    if @comment.save
      respond_to do |format|
        format.html { redirect_to trip_path(@trip), notice: "comment was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @quotes = Quote.ordered
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
    respond_to do |format|
      format.html { redirect_to trip_comments_path(@comment), notice: "Comment was successfully destroyed." }
      format.turbo_stream
    end
  end
  # def likes
  # end

  private

  def comment_params
    params.require(:comment).permit(:description, :trip_id)
  end
end
