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


  def destroy

  end



  # FIXME  review and fix as needed
  # def selection_params
  #   params.require(:station).permit(:id)
  # end

end
