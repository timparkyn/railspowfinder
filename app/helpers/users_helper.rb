require 'json'

module UsersHelper

  def get_forecast(stations)
    w_api = Wunderground.new("dda1e42fba07eb1c")
    @user.forecast = [];

    # user forecast is an array of forecasts
    stations.each do |station|
        puts station
      @user.forecast.push(w_api.forecast_and_conditions_for("pws:#{station.code}"))
    end


# quick check
    if @user.forecast
      puts @user.forecast.length
    end

  end
end






# _*_*(_*_*_*_*_*_*  Current Observations by full day period
#         var location = response['location']['city'];
#         weatherData.temp_f= response.current_observation.temp_f;
#         weatherData.altitude = response.current_observation.observation_location.elevation.slice(0, -3);
#         weatherData.weather_obs = response.current_observation.weather;
#         weatherData.wind_string = response.current_observation.wind_string;
#         weatherData.wind_dir = response.current_observation.wind_dir;
#         weatherData.wind_mph = response.current_observation.wind_mph;
#         weatherData.wind_gust_mph = response.current_observation.wind_gust_mph;
#         weatherData.snow_day = response.forecast.precip_1hr_in;
#         weatherData.forecast = response.forecast.txt_forecast.forecastday[0].fcttext;
#         weatherData.precip_1hr = response.current_observation.precip_1hr_in;
#         weatherData.precip_today = response.current_observation.precip_today_in;
#         weatherData.time = response.current_observation.observation_time_rfc822.slice(0, -9); // trim string for clarity
