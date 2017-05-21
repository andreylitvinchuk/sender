class Game < ApplicationRecord
  validates :name, :access_token, presence: true
end
