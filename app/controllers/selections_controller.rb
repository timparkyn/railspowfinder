class SelectionsController < ApplicationController
  include SelectionsHelper
  def index
    @selections = current_user.stations # provides an array of station objects
    @forecasts = get_forecast(@selections)
    @unselected_stations = Station.all - @selections
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

 def destroy
   Selection.find_by(user_id: current_user.id,
                  station_id: params[:id]).destroy
   redirect_to user_selections_path
 end

  # FIXME:  review and fix as needed
  # def selection_params
  #   params.require(:station).permit(:id)
  # end
end
