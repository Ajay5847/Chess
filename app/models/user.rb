class User < ApplicationRecord
  # Associations
  has_many :games_as_player_one, class_name: Game.name, foreign_key: :player_one_id, dependent: :destroy
  has_many :games_as_player_two, class_name: Game.name, foreign_key: :player_two_id, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
