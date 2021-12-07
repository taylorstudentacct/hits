json.extract! comment, :id, :picture_id, :text, :created_by, :created_at, :updated_at
json.url comment_url(comment, format: :json)
