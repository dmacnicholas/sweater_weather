require 'rails_helper'

RSpec.describe LocationService do

  it 'returns json location/lat/lon for given location', :vcr do

    location = LocationService.location_search('3002 Halenwool Cir Franklin, TN')

    expect(location).to be_a Hash
    expect(location).to have_key(:results)
    expect(location[:results]).to be_an Array
    expect(location[:results][0]).to have_key(:locations)
    expect(location[:results][0][:locations][0]).to have_key(:latLng)
    expect(location[:results][0][:locations][0][:latLng]).to have_key(:lat)
    expect(location[:results][0][:locations][0][:latLng]).to have_key(:lng)
    expect(location[:results][0][:locations][0][:latLng][:lat]).to eq(35.923652)
    expect(location[:results][0][:locations][0][:latLng][:lng]).to eq(-86.867827)
  end
end
