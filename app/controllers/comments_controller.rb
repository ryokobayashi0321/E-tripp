class CommentsController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @comment = @spot.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
  end

  def destroy
    comment = Comment.find_by(spot_id: params[:spot_id], user_id: current_user.id)
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
