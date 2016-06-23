class ArticlesController < ApplicationController
  include SessionsHelper

  def show
    @article = Article.find_by(id: params[:id])
    @comments = @article.comments
  end

  def new
    @article = Article.new
    @article.user_id = current_user.id
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to article_path(@article)
    else
      redirect_to new_article_path
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
