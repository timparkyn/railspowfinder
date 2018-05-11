class StationsController < ApplicationController
  attr_accessor :stations
  before_action :admin_user, only: [:index, :show, :new, :edit, :update, :destroy]

  def index
    @stations = Station.all
  end

  def show
    @station = Station.find(params[:id])
  end

  def new
    @station = Station.new
  end

  def edit
    @station = Station.find(params[:id])
  end

  def create
    respond_to do |format|
      @station = Station.new(station_params)
      puts @station.inspect
      if @station.save
        format.html {
          redirect_to @station,
          notice: 'Station was successfully created.'
        }
        format.json {
          render :show,
          status: :created,
          location: @station
        }
      else
        format.html { render  :new }
        format.json {
          render  json: @station.errors,
                status: :unprocessable_entity
        }
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
    Station.find(params[:id]).destroy
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

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
