require 'rails_helper'

RSpec.describe Book do

  it 'exists and has readable attributes' do
    book = Book.new(isbn: "0762519037", title: "Winchester/Franklin Tn298", publisher: "Universalmap")

    expect(book).to be_a(Book)
    expect(book.title).to eq("Winchester/Franklin Tn298")
    expect(book.publisher).to eq("Universalmap")
    expect(book.isbn).to eq("0762519037")
  end
end
