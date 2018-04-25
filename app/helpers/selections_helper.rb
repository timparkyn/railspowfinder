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
        station_id: selection.id,
        description: selection.description,
        observations: response.current_observation,
        elevation: response.current_observation.observation_location.elevation
      }
      daily_forecasts = response.forecast.simpleforecast.forecastday

      forecast[:daily_fx] = daily_forecasts.map do |fx|
        {
          day: fx.date.weekday_short,
          pop: fx.pop,
          qpf: fx.qpf_allday.in,
          snow_in: fx.snow_allday.in,
          max_wind_mph: fx.maxwind.mph
        }
      end
      forecast
    end

    # puts '---------------------------'

  end
end
