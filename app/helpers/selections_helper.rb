require 'json'
require 'ostruct'

module SelectionsHelper

  def get_forecast(stations)

    w_api = Wunderground.new("dda1e42fba07eb1c")
    current_user.forecast = [];

    @forecasts = []

    # user forecast is an array of forecasts
    current_user.selections.each do |selection|
      station = selection.station
      forecast = {selection_id: selection.id}
      forecast['description'] = station.description

      raw_response = w_api.forecast_and_conditions_for("pws:#{station.code}")
      response = JSON.parse(raw_response.to_json, object_class: OpenStruct)

      forecast['observations'] = response.current_observation
      # convert from metric to imperial, round up, drop any float
      forecast['elevation'] = (forecast['observations'].display_location.elevation.to_i * 3.28084).round

      daily_forecasts = response.forecast.simpleforecast.forecastday
      forecast['dailyFx'] = {}
      forecast['dailyFx']['day'] = []
      forecast['dailyFx']['pop'] = []
      forecast['dailyFx']['qpf'] = []
      forecast['dailyFx']['snowIn'] = []
      forecast['dailyFx']['maxwindMph'] = []

      daily_forecasts.each do |fx|
         forecast['dailyFx']['day'].push(fx.date.weekday_short)
         forecast['dailyFx']['pop'].push(fx.pop)
         forecast['dailyFx']['qpf'].push(fx.qpf_allday.in) #.in
         forecast['dailyFx']['snowIn'].push(fx.snow_allday.in)
         forecast['dailyFx']['maxwindMph'].push(fx.maxwind.mph) #.mpg
      end

      @forecasts.push(forecast)

    end

  end

end
