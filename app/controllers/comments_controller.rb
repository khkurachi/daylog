class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/days/#{comment.day.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, day_id: params[:day_id])
  end
end