class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @article = Article.find_by(id: [:article_id])
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
  end

  def create
    @comment = Comment.new(comment_params)
    @article = Article.find(params[:article_id])
    @comment.user_id = current_user.id
    @comment.article_id = @article.id
    if @comment.save
      render
    else
      redirect
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end