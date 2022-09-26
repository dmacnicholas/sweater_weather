class LocationFacade
    def self.create_location(location)
        result = LocationService.location_search(location)
        Location.new(result)
    end
end 
