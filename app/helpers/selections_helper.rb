require 'json'
require 'ostruct'

module SelectionsHelper

  def get_forecast(selections)

    w_api = Wunderground.new(ENV["WUNDERGROUND_API_KEY"])

    # user forecast is an array of forecasts
    selections.each do |selection|
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

      #response returns an array of forecast objects
      daily_forecasts = response.forecast.simpleforecast.forecastday
      daily_forecasts.each do |fx|
        forecast[:daily_fx][:day].push(fx.date.weekday_short)
        forecast[:daily_fx][:pop].push(fx.pop)
        forecast[:daily_fx][:qpf].push(fx.qpf_allday.in) #.in
        forecast[:daily_fx][:snow_in].push(fx.snow_allday.in)
        forecast[:daily_fx][:max_wind_mph].push(fx.maxwind.mph) #.mpg
      end
      @forecasts.push(forecast)
    end
  end
end
