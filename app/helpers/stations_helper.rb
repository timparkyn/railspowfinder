module StationsHelper

  def get_forecast(stations)
    w_api = Wunderground.new("dda1e42fba07eb1c")
    current_user.forecast = [];

    # user forecast is an array of forecasts
    current_user.stations.each do |station|
      current_user.forecast.push(w_api.forecast_and_conditions_for("pws:#{station.code}"))
    end




  end

end
