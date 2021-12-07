json.extract! user, :id, :username, :first_name, :last_name, :user_type, :phone_number, :created_at, :updated_at
json.url user_url(user, format: :json)
json.token user.generate_jwt