class BookSerializer
  def self.search_for_books(books, forecast, location)
   { "data":
     {
       "id": 'null',
       "type": 'books',
       "attributes": {
         "destination": location,
         "forecast": {
           "summary": forecast.description,
           "temperature": forecast.temp
           },

       "total_books_found": books[1],
       "books": books[0].map do |book|
         {
           "title": book.title,
           "isbn": book.isbn,
           "publisher": book.publisher
         }
       end
       }
     }
   }
 end
end
