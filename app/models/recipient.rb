class Recipient < ApplicationRecord
  belongs_to :player
  belongs_to :newsletter
end
