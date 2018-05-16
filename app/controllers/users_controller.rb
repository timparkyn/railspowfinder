class UsersController < ApplicationController
  include SessionsHelper

  before_action :admin_user, only: [:index, :destroy]
  before_action :logged_in_user, only: [:show, :edit, :update ]
  before_action :correct_user,   only: [:show, :edit, :update]


  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Welcome to Powfinder.'
      redirect_to user_selections_path(user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    # FIXME: check this .attributes --- attempt to update selections through #user/show
    # @user.attributes = {'station_ids' => []}.merge(params[:user] || {})
  end

  def update
      # FIXME : How to manage user updates vs. selection updates

    @user = User.find(params[:id])
    @user.attributes = {'station_ids' => []}.merge( user_params || {}) # params[:user]
    if @user.update_attributes(user_params)
      flash[:success] = 'Info updated.'
      redirect_to user_selections_path(user) # @user
    else
      flash[:danger] = 'Denied.'
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = 'User deleted'
    redirect_to users_url
  end

  private
    # FIXME: pathing isn't correct
    def user_params
      params.require(:user)
        .permit(:name, :email, :password, :password_confirmation, :_destroy, station_ids: [] )
      # station.id,
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
