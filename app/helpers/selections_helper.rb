require 'json'
require 'ostruct'

module SelectionsHelper

  def get_forecast(selections)

    w_api = Wunderground.new("dda1e42fba07eb1c")

    # user forecast is an array of forecasts
    selections.each do |selection|

      # forecast['description'] = selection.code

      raw_response = w_api.forecast_and_conditions_for("pws:#{selection.code}")
      response = JSON.parse(raw_response.to_json, object_class: OpenStruct)

      forecast = {
        selection_id: selection.id,
        description: selection.code,
        observations: response.current_observation,
        elevation: response.current_observation.observation_location.elevation,
        daily_fx: {
          day: [],
          pop: [],
          qpf: [],
          snow_in: [],
          max_wind_mph: []
        }
      }

      # puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
      # puts forecast
      # puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
      # puts forecast.description
      # puts forecast.dailyFx
      # puts forecast.dailyFX.day
      # puts forecast.inspect
      # forecast['observations'] = response.current_observation
      # forecast['elevation'] = forecast['observations'].observation_location.elevation
      #
      #
      # forecast['dailyFx'] = {}
      # forecast['dailyFx']['day'] = []
      # forecast['dailyFx']['pop'] = []
      # forecast['dailyFx']['qpf'] = []
      # forecast['dailyFx']['snowIn'] = []
      # forecast['dailyFx']['maxwindMph'] = []

      #response returns an array of forecast objects
      daily_forecasts = response.forecast.simpleforecast.forecastday
      daily_forecasts.each do |fx|
        forecast[:daily_fx][:day].push(fx.date.weekday_short)
        forecast[:daily_fx][:pop].push(fx.pop)
        forecast[:daily_fx][:qpf].push(fx.qpf_allday.in) #.in
        forecast[:daily_fx][:snow_in].push(fx.snow_allday.in)
        forecast[:daily_fx][:max_wind_mph].push(fx.maxwind.mph) #.mpg


         # forecast['dailyFx']['day'].push(fx.date.weekday_short)
         # forecast['dailyFx']['pop'].push(fx.pop)
         # forecast['dailyFx']['qpf'].push(fx.qpf_allday.in) #.in
         # forecast['dailyFx']['snowIn'].push(fx.snow_allday.in)
         # forecast['dailyFx']['maxwindMph'].push(fx.maxwind.mph) #.mpg
      end

      @forecasts.push(forecast)

    end

  end

end
