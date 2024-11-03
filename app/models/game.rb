class Game < ApplicationRecord
  belongs_to :player_one, class_name: User.name
  belongs_to :player_two, class_name: User.name

  # Validations
  validates :player_one, presence: true
  validates :player_two, presence: true
end
