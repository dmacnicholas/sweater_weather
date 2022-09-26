class Weather
  attr_reader :result, :id

  def initialize(result)
    @id = nil
    @result = result

  end

  def forecast
    {
      data: {
        id: nil,
        type: "forecast",
        attributes:
          {
            current_weather: CurrentForecast.data(result[:current]),
            daily_weather: DailyForecast.data(result[:daily]),
            hourly_weather: HourlyForecast.data(result[:hourly])
          }
      }
    }
  end
end
