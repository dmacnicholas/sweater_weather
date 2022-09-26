class BookFacade

  def self.get_the_books(location, quantity)
    data = BookService.book_search(location, quantity)
    num_found = data[:numFound]
    books = data[:docs].map do |book|
      Book.new(book)
    end
    results = [books, num_found]
  end
end
