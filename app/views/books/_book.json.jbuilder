json.extract! book, :id, :name, :original_name, :slug, :cover_img, :publish_year, :about, :created_at, :updated_at
json.url book_url(book, format: :json)
