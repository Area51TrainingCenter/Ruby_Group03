json.array!(@books) do |book|
  json.extract! book, :id, :title, :description, :published_at
  json.url book_url(book, format: :json)
end
