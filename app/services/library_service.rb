class LibraryService

  def conn
    Faraday.new("https://openlibrary.org")
  end

  def book_search(location, quantity)
    response = conn.get("/search.json?q=#{location}&limit=#{quantity}")
    JSON.parse(response.body, symbolize_names: true) if response.status == 200
  end
end
