json.extract! player, :id, :name, :vk_id, :level, :last_visit, :paid, :created_at, :updated_at
json.url player_url(player, format: :json)
