class HourlyForecast
  def self.data(attributes)
    attributes.map do |hourly|
      {
        time: Time.at(hourly[:dt]).strftime("%H:%M:%S"),
        temperature: hourly[:temp],
        conditions: hourly[:weather][0][:description],
        icon: hourly[:weather][0][:icon]
      }
    end
  end
end
