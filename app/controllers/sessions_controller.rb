class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:session][:username].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = "Invalid login, try again."
      render 'new'
    end
  end

  def destroy
    session.delete(:id)
    redirect_to root_path
  end
end
