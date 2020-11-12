json.extract! author, :id, :first_name, :last_name, :slug, :nation_id, :birth_day, :death_day, :birth_place, :death_place, :photo, :created_at, :updated_at
json.url author_url(author, format: :json)
