class UsersController < ApplicationController
  include SessionsHelper

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  attr_accessor :admin_user, :logged_in_user

  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
    @stations = Station.all
    @selections = current_user.stations # provides an array of station objects
    @unselected_stations = Station.all - @selections
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
    # FIXME : check current_user issue; login on user#create
      session[:user_id] = @user.id
      redirect_to user_selections_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    # FIXME: check this .attributes --- old code?
    @user.attributes = {'station_ids' => []}.merge(params[:user] || {})
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = 'Info updated.'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:danger] = 'User deleted'
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user)
        .permit(:name, :email, :password, :password_confirmation, stations_attributes: [:id, :user_id, :_destroy, selection_ids: []])
      # params.require(:user).permit(:date, selections: [])
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
