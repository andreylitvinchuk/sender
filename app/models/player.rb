class Player < ApplicationRecord
  validates :name, :vk_id, presence: true

  def self.prop_names
    column_names - ['id', 'created_at', 'updated_at']
  end

end
