class CommentsController < ApplicationController
  def create
    @comment = Comment.new(cmt_params)
    if @comment.save
      redirect_to send_path(@comment.send)
    else
      @send = @comment.send
      @comments = @send.comments
      render "sends/show"
    end
  end
  
  
  private
  def cmt_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, send_id: params[:send_id])
  end
end
