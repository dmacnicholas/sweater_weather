class BookSerializer
    def self.book_search(location, forecast, books)

     { "data":
       {
         "id": 'null',
         "type": 'books',
         "attributes": {
           "destination": location,
           "forecast": {
             "summary": forecast.conditions,
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
