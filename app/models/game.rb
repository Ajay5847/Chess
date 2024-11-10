class Game < ApplicationRecord
  serialize :board_state, Array

  enum :status, {
    pending:    0,
    started:    1,
    incomplete: 2,
    draw:       3,
    complete:   4
  }

  has_many :moves, dependent: :destroy

  belongs_to :player_one, class_name: User.name
  belongs_to :player_two, class_name: User.name

  # Validations
  validates :player_one, presence: true
  validates :player_two, presence: true

  after_initialize :initialize_chess_game

  # Initialize a new Chess::Game object with the loaded board_state or default setup
  def initialize_chess_game
    @chess_game = Chess::Game.new
    if board_state.present?
      @chess_game.load_board_state(board_state)
    else
      @chess_game.setup_board
      self.board_state = @chess_game.board_to_array
      save!
    end
  end

  # Save board state after each move
  def update_board_state
    self.board_state = @chess_game.board_to_array
    save!
  end

  def make_move(start_pos, end_pos)
    chess_game.play_turn(start_pos, end_pos)
  end
end
