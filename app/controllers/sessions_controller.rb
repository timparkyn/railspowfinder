class SessionsController < ApplicationController
  include SessionsHelper
  def index
  end

  def show
  end

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_selections_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def edit
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
