require 'rails_helper'

RSpec.describe LocationFacade do
    it "returns location attributes of latitude and longitude", :vcr do
        location = LocationFacade.create_location("3002 Halenwool Cir Franklin, TN")
        expect(location).to be_a(Location)
        expect(location.latitude).to be_a(Float)
        expect(location.longitude).to be_a(Float)
    end
end
