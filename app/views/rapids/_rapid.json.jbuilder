json.extract! rapid, :id, :name, :river_id, :location, :description,
              :difficulty, :created_at, :updated_at
json.url rapid_url(rapid, format: :json)
