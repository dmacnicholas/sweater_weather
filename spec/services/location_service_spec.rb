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

  it "can return start city, end city, and travel time for a road trip", :vcr do

    directions = LocationService.directions_search("Denver, CO", "Nashville, TN")

    expect(directions).to be_a(Hash)

    expect(directions).to have_key(:route)

    expect(directions[:route]).to have_key(:boundingBox)

    expect(directions[:route][:boundingBox]).to have_key(:lr)
    expect(directions[:route][:boundingBox][:lr]).to have_key(:lng)
    expect(directions[:route][:boundingBox][:lr][:lng]).to be_a(Float)
    expect(directions[:route][:boundingBox][:lr]).to have_key(:lat)
    expect(directions[:route][:boundingBox][:lr][:lat]).to be_a(Float)
    expect(directions[:route][:boundingBox][:lr][:lat]).to be_a(Float)
    expect(directions[:route]).to have_key(:formattedTime)
    expect(directions[:route][:formattedTime]).to be_a(String)
  end
end
