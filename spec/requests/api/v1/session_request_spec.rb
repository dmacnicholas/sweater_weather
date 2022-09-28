require 'rails_helper'

RSpec.describe "Session Creation" do
  describe 'finds a user session after login, happy path' do
    it 'returns a 200 status code' do
      user_1 = User.create(email: "drew@test.com", password: "password123", password_confirmation: "password123")

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_data = { "email": "drew@test.com", "password": "password123" }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_data)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to be_a(Hash)
      expect(user).to have_key(:data)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).to be_a(Integer)
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).to be_a(String)
    end
  end

  describe 'cannot locate a user session trying to login, sad path' do
    it 'returns a 401 status code for user does not exist' do
      user_1 = User.create(email: "drew@test.com", password: "password123", password_confirmation: "password123")

      headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
      user_data = { "email": "drew@drew.com", "password": "password123" }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_data)


      expect(response.status).to eq(401)
      expect(response.body).to eq("{\"message\":\"User email or password is invalid.\"}")

    end
  end

  it 'returns a 401 status code when email is incorrect' do
    user_1 = User.create(email: "drew@test.com", password: "password123", password_confirmation: "password123")


    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
    user_data = { "email": "drew@test.com", "password": "password122" }
    post '/api/v1/sessions', headers: headers, params: JSON.generate(user_data)


    expect(response.status).to eq(401)
    expect(response.body).to eq("{\"message\":\"User email or password is invalid.\"}")

  end
end
