class Game < ApplicationRecord
  belongs_to :player_one, class_name: User.name
  belongs_to :player_two, class_name: User.name

  # Validations
  validates :player_one, presence: true
  validates :player_two, presence: true

  def chess_game
    @chess_game ||= Chess::Game.new
  end

  def make_move(start_pos, end_pos)
    chess_game.play_turn(start_pos, end_pos)
  end
end
