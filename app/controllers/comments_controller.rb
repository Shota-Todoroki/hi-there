class CommentsController < ApplicationController
  def create
    @comment = Comment.new(cmt_params)
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      @article = @comment.article
      @comments = @article.comments
      redirect_to article_path(@article.id)
    end
  end
  
  
  private
  def cmt_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
