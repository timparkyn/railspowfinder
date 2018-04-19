class SelectionsController < ApplicationController

  def create
    station = Station.find(selection_params[:id])
    Selection.find_or_create_by(user_id: current_user.id, station_id: station.id)
    redirect_to user_path
  end

  def destroy
    Selection.find(selection_params[:id]).destroy
    # [:selection_id]
    redirect_to user_path
  end

  private

  def selection_params
    params.require(:station).permit(:id)
  end

end
