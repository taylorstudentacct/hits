json.extract! river, :id, :name, :location, :description, :classrange,
              :created_at, :updated_at
json.url river_url(river, format: :json)
