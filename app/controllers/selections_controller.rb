class SelectionsController < ApplicationController
  include SelectionsHelper
  include SessionsHelper
  def index
    @selections = current_user.stations # current_user.stations # provides an array of station objects
    @forecasts = get_forecast(current_user.stations) # @selections
    @stations = Station.all
    @unselected_stations = @stations - @selections
    @user = current_user
  end

  def show
  end

  def new
    @selection = Selection.new
  end

  def create
     Selection.find_or_create_by(user_id: current_user.id,
                              station_id: params[:id])
     redirect_to user_selections_path
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params)
    # if @user.update_attributes(user_params)
    #   flash[:success] = 'Info updated.'
      redirect_to @selection
    else
      render 'user#show'
    end
  end

  def destroy
   Selection.find_by(user_id: current_user.id,
                  station_id: params[:id]).destroy
   redirect_to user_selections_path
  end

end
