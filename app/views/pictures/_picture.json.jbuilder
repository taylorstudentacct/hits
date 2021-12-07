json.extract! picture, :id, :rapid_id, :uploaded_by, :picture, :created_at,
              :updated_at
json.url picture_url(picture, format: :json)
