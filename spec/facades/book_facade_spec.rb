require 'rails_helper'

RSpec.describe BookFacade do
  it 'returns book data', :vcr do
      location = "Nashville, TN"
      quantity = 5

      results = BookFacade.get_the_books(location, quantity)

      expect(results).to be_a(Array)
      expect(results[0]).to be_all Book
      expect(results[1]).to be_an Integer
    end
end
