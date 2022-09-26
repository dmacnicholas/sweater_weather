class WeatherFacade
  def self.create_forecast(latitude, longitude)
    result = WeatherService.weather_search(latitude, longitude)
    Weather.new(result)
  end
end
