json.extract! friendship, :id, :friend1_id, :friend2_id, :created_at,
              :updated_at
json.url friendship_url(friendship, format: :json)
