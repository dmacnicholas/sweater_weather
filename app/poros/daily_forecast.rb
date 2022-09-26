class DailyForecast
  def self.data(attributes)
    attributes.map do |daily|
      {
        date: Time.at(daily[:dt]).strftime("%Y-%m-%d"),
        sunrise: Time.at(daily[:sunrise]),
        sunset: Time.at(daily[:sunset]),
        max_temp: daily[:temp][:max],
        min_temp: daily[:temp][:min],
        conditions: daily[:weather].first[:description],
        icon: daily[:weather].first[:icon]
      }
    end
  end
end
