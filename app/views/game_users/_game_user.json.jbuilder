json.extract! game_user, :id, :name, :vk_id, :level, :last_visit, :paid, :created_at, :updated_at
json.url game_user_url(game_user, format: :json)
