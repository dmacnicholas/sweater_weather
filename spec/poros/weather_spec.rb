require 'rails_helper'

RSpec.describe Weather do
  it 'can return weather attributes' , :vcr do
    result = WeatherService.weather_search(35.9237, -86.8678)

    forecast = Weather.new(result)

    expect(forecast).to be_a Weather
    expect(forecast.datetime).to be_a(String)
    expect(forecast.sunrise).to be_a(String)
    expect(forecast.sunset).to be_a(String)
    expect(forecast.temp).to be_a(Float)
    expect(forecast.feels_like).to be_a(Float)
    expect(forecast.humidity).to be_an(Integer)
    expect(forecast.uvi).to be_an(Integer)
    expect(forecast.visibility).to be_an(Integer)
    expect(forecast.conditions).to be_a(String)
    expect(forecast.icon).to be_a(String)
  end
end
