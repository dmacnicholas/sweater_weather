require 'rails_helper'

RSpec.describe 'road trip API' , :vcr do
  it 'returns road trip information based off of user input' do
    user = User.create!(email: 'drew@test.com', password: "$2a$04$uoYSPIV4t.z5O4rhHa6I.OcnAzJnlrl90sOQuMop6F62EwzCgTSGW")

    road_trip_attributes = {
      "origin": 'Denver, CO',
      "destination": 'Nashville, TN',
      "api_key": "#{user.api_key}"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip_attributes)


    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:id)
    expect(json).to have_key(:type)
    expect(json[:type]).to eq("roadtrip")
    expect(json).to have_key(:attributes)
    expect(json[:attributes]).to have_key(:start_city)
    expect(json[:attributes]).to have_key(:end_city)
    expect(json[:attributes]).to have_key(:travel_time)
    expect(json[:attributes]).to have_key(:weather_at_eta)
    expect(json[:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(json[:attributes][:weather_at_eta]).to have_key(:conditions)
  end

  it 'returns 401 status if api key is missing' do
    user = User.create!(email: 'drew@test.com', password: "$2a$04$uoYSPIV4t.z5O4rhHa6I.OcnAzJnlrl90sOQuMop6F62EwzCgTSGW", api_key: "02b1f503a4920179032b4c36103c1053")

    road_trip_attributes = {
      "origin": 'Denver, CO',
      "destination": 'Nashville, TN'
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip_attributes)

    expect(response).to have_http_status(401)
  end

  it 'returns 401 status if api key is unauthorized' do
    user = User.create!(email: 'drew@test.com', password: "$2a$04$uoYSPIV4t.z5O4rhHa6I.OcnAzJnlrl90sOQuMop6F62EwzCgTSGW", api_key: "02b1f503a4920179032b4c36103c1053")

    road_trip_attributes = {
      "origin": 'Denver, CO',
      "destination": 'Nashville, TN',
      "api_key": "bad key"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip_attributes)

    expect(response).to have_http_status(401)
  end

  it 'returns impossibe route based off of user input' do
    user = User.create!(email: 'drew@test.com', password: "$2a$04$uoYSPIV4t.z5O4rhHa6I.OcnAzJnlrl90sOQuMop6F62EwzCgTSGW")

    road_trip_attributes = {
      "origin": 'New York, NY',
      "destination": 'London, UK',
      "api_key": "#{user.api_key}"
    }

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept": 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(road_trip_attributes)


    expect(response).to be_successful
    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:id)
    expect(json).to have_key(:type)
    expect(json[:type]).to eq("roadtrip")
    expect(json).to have_key(:attributes)
    expect(json[:attributes]).to have_key(:start_city)
    expect(json[:attributes]).to have_key(:end_city)
    expect(json[:attributes]).to have_key(:travel_time)
  end
end
