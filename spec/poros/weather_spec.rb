require 'rails_helper'

RSpec.describe Weather do
  it 'can return weather attributes' , :vcr do
    result = WeatherService.weather_search(35.9237, -86.8678)

    forecast = Weather.new(result).forecast
    expect(forecast[:data]).to have_key(:attributes)
    expect(forecast[:data][:attributes]).to have_key(:current_weather)
    expect(forecast[:data][:attributes][:daily_weather]).to be_an(Array)
    expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
  end
end
