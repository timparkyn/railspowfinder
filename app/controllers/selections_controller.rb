class SelectionsController < ApplicationController

  def add
    @user = User.find(session[:user_id])
    @station = Station.all
    # figure this out
    @selection = Selection.new(params:user_id, station_id)
  end


  def destroy

  end




end
