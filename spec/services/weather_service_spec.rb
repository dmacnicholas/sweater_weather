require 'rails_helper'

RSpec.describe WeatherService do
  it 'can return weather attributes for a specific lat & long' , :vcr do
    result = WeatherService.weather_search(35.9237, -86.8678)

      expect(result).to be_a(Hash)

      expect(result).to have_key(:lat)
      expect(result[:lat]).to eq(35.9237)

      expect(result).to have_key(:lon)
      expect(result[:lon]).to eq(-86.8678)

      expect(result).to include(:current, :hourly, :daily)
      expect(result).to_not include(:minutely, :alerts)

      expect(result).to have_key(:current)
      expect(result[:current]).to have_key(:dt)
      expect(result[:current]).to have_key(:sunrise)
      expect(result[:current]).to have_key(:sunset)
      expect(result[:current]).to have_key(:feels_like)
      expect(result[:current]).to have_key(:uvi)
      expect(result[:current]).to have_key(:visibility)
      expect(result[:current]).to have_key(:uvi)
      expect(result[:current][:weather][0]).to have_key(:description)
      expect(result[:current][:weather][0]).to have_key(:icon)

      expect(result).to have_key(:daily)
      expect(result[:daily][0]).to have_key(:dt)
      expect(result[:daily][0]).to have_key(:sunrise)
      expect(result[:daily][0]).to have_key(:sunset)
      expect(result[:daily][0][:temp]).to have_key(:max)
      expect(result[:daily][0][:temp]).to have_key(:min)
      expect(result[:daily][0][:weather][0]).to have_key(:description)
      expect(result[:daily][0][:weather][0]).to have_key(:icon)

      expect(result).to have_key(:hourly)
      expect(result[:hourly][0]).to have_key(:dt)
      expect(result[:hourly][0]).to have_key(:temp)
      expect(result[:hourly][0][:weather][0]).to have_key(:description)
      expect(result[:hourly][0][:weather][0]).to have_key(:icon)
  end
end
