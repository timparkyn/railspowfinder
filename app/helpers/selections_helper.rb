require 'json'
require 'ostruct'

module SelectionsHelper
  def get_forecast(selections)
    w_api = Wunderground.new(ENV["WUNDERGROUND_API_KEY"])

    # user forecast is an array of forecasts
    selections.map do |selection|
      raw_response = w_api.forecast_and_conditions_for("pws:#{selection.code}")
      response = JSON.parse(raw_response.to_json, object_class: OpenStruct)

      forecast = {
        :station_id =>selection.id,
        :description => selection.description,
        :elevation => response.current_observation.observation_location.elevation,
        :observations => {
          :time => response.current_observation.observation_time_rfc822,
          :temp => response.current_observation.temp_f,
          :wind => response.current_observation.wind_string,
          :precip_today => response.current_observation.precip_today_in,
          :precip_1hr => response.current_observation.precip_1hr_in
        }
      }

      daily_forecasts = response.forecast.simpleforecast.forecastday
      forecast[:daily_fx] = daily_forecasts.map do |fx|
        {
          :day => fx.date.weekday_short,
          :pop => fx.pop,
          :qpf => fx.qpf_allday.in,
          :snow_in => fx.snow_allday.in,
          :max_wind_mph => fx.maxwind.mph
        }
      end
      forecast
    end
  end
end
