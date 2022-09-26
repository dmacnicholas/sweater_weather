class WeatherService
  def self.conn
    Faraday.new("https://api.openweathermap.org") do |faraday|
      faraday.params['appid'] = ENV['weather_key']
    end
  end

  def self.weather_search(latitude, longitude)
    response = conn.get("/data/2.5/onecall?lat=#{latitude}&lon=#{longitude}&exclude=minutely,alerts&units=imperial")
    JSON.parse(response.body, symbolize_names: true) if response.status == 200
  end
end
