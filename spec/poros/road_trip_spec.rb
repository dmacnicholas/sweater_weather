require 'rails_helper'

RSpec.describe RoadTrip do
  it 'can exist and have attributes' do
    attributes = {
      start_city: 'Denver, CO',
      end_city: 'Nahsville',
      travel_time: '14:14:14',
      weather_at_eta: {
        temp: 77.7,
        weather:[{id:703, main:"Clouds", description:"broken clouds", icon:"04n"}]
      }
    }

    roadtrip = RoadTrip.new(attributes)

    expect(roadtrip.start_city).to eq(attributes[:start_city])
    expect(roadtrip.end_city).to eq(attributes[:end_city])
    expect(roadtrip.travel_time).to eq('14 hours, 14 minutes')
    expect(roadtrip.weather_at_eta).to be_a(Hash)
    expect(roadtrip.weather_at_eta[:temperature]).to eq(77.7)
    expect(roadtrip.weather_at_eta[:conditions]).to eq("broken clouds")
  end

end
