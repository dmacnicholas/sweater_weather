class LocationService
  def self.conn
      Faraday.new("https://www.mapquestapi.com") do |faraday|
          faraday.params['key'] = ENV['map_quest_key']
      end
  end

  def self.location_search(location)
      response = conn.get("/geocoding/v1/address?location=#{location}")
      json = JSON.parse(response.body, symbolize_names: true) if response.status == 200
  end

  def self.directions_search(origin, destination)
      response = conn.get("/directions/v2/route?from=#{origin}&to=#{destination}")
      json = JSON.parse(response.body, symbolize_names: true) if response.status == 200
  end
end
