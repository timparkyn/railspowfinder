class StaticPagesController < ApplicationController
  def home
    if logged_in?
      redirect_to user_selections_path(current_user)
    end
  end

  def help
  end

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def delete
  end
end
