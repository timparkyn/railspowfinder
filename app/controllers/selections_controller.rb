include SelectionsHelper

class SelectionsController < ApplicationController

  def index
    #provides an array of station objects
    @selections = current_user.stations
    @forecasts = []
    get_forecast(@selections)
    # updates list of available stations for user
    @unselected_stations = Station.all - @selections
  end

  def show
  end

  def new
    @selection = Selection.new
  end

  def create
     station = Station.find(params[:id])
     Selection.find_or_create_by(user_id: current_user.id, station_id: station.id)
     redirect_to user_selections_path
   end

   def destroy
     Selection.find(params[:id]).destroy
     redirect_to user_selections_path
   end



  # FIXME:  review and fix as needed
  # def selection_params
  #   params.require(:station).permit(:id)
  # end

end
