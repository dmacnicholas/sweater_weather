require 'rails_helper'

RSpec.describe Location do

  it 'exists and has readable attributes', :vcr do
    data = LocationService.location_search('3002 Halenwool Cir Franklin, TN')
    location = Location.new(data)
    expect(location).to be_a(Location)
    expect(location.latitude).to eq(35.923652)
    expect(location.longitude).to eq(-86.867827)
  end
end
