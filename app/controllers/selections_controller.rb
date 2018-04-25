include SelectionsHelper

class SelectionsController < ApplicationController

  def index
    @selections = current_user.stations    #provides an array of station objects
    @forecasts = []
    get_forecast(@selections)
    @unselected_stations = Station.all - @selections # updates list of available stations for user
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
     Selection.find_by(params[:station_id]).destroy
     redirect_to user_selections_path
   end



  # FIXME:  review and fix as needed
  # def selection_params
  #   params.require(:station).permit(:id)
  # end

end
