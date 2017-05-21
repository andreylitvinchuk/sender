class Player < ApplicationRecord

  def self.prop_names
    column_names - ['id', 'created_at', 'updated_at']
  end

end
