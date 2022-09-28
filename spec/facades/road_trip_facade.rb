require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'can create forecast for location', :vcr do
    roadtrip = RoadTripFacade.create_roadtrip('Denver, CO', 'Nashville, TN')

    expect(roadtrip).to be_a(RoadTrip)

    expect(roadtrip.start_city).to eq('Denver, CO')
    expect(roadtrip.end_city).to eq('Nashville, TN')
    expect(roadtrip.time).to be_a(Integer)
    expect(roadtrip.travel_time).to be_a(String)
    expect(roadtrip.travel_time).to include('hours,')
    expect(roadtrip.travel_time).to include('minutes')
  end
end
