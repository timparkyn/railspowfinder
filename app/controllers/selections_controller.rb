include SelectionsHelper

class SelectionsController < ApplicationController

  def index
    @selections = current_user.stations
    puts '* * ** * * ** * * ** * **'
    puts @selections
    get_forecast(@selections)

    # why doesnt this work?
    @unselected_stations = Station.all - @selections
  end

  def show
  end


  def new
    @selection = Selection.new
  end

  def end
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

  private

  # def selection_params
  #   params.require(:station).permit(:id)
  # end

end
