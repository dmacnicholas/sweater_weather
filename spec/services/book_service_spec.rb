require 'rails_helper'

RSpec.describe BookService do
  it 'returns book data', :vcr do
      location = "Nashville, TN"
      quantity = 5

      results = BookService.book_search(location, quantity)

      expect(results).to be_a(Hash)
      expect(results).to have_key(:numFound)
      expect(results[:numFound]).to be_a(Integer)

      expect(results).to have_key(:docs)
      expect(results[:docs]).to be_a(Array)
      expect(results[:docs].count).to eq(quantity)

      book = results[:docs].first
      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)

      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_a(Array)
      book[:isbn].each do |num|
      expect(num).to be_a(String)
      end

      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_a(Array)
      book[:publisher].each do |pub|
      expect(pub).to be_a(String)
    end
  end
end
