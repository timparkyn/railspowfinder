class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]
  attr_accessor :stations
  # FIXME: restrict controller for Admin only
  def index
    @stations = current_user.stations
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new

    respond_to do |format|
      if @station.save
        format.html { redirect_to @station,
                      notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render  :new }
        format.json { render  json: @station.errors,
                              status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station,
                      notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render  :edit }
        format.json { render  json: @station.errors,
                              status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url,
                    notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def station_params
    params.require(:station).permit(:code, :location_name)
  end
end
