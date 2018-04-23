include SelectionsHelper

class SelectionsController < ApplicationController

  def index
    @selections = current_user.selections
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
    puts '* * * * * * * * * *'
    puts params
    station = Station.find(params[:id])
    Selection.find_or_create_by(user_id: current_user.id, station_id: station.id)
    redirect_to user_selections_path
  end

  def destroy
    puts '------------------------------'
    # station = Station.find(selection_params[:id])
    puts params
    # puts Selection.find(user_id: current_user.id, station_id: station.id)
    # Selection.find_by(user_id: current_user.id, station_id: station.id).destroy
    Selection.find(params[:id]).destroy
    redirect_to user_selections_path
  end

  private

  # def selection_params
  #   params.require(:station).permit(:id)
  # end

end
