class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @articles = @user.articles
    @comment = @user.comments
  end
end
