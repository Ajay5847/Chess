module Chess
  class Game
    attr_accessor :chessboard, :current_turn

    def initialize
      @chessboard = Chessboard.new
      @current_turn = :white
    end

    def play_turn(start_position, end_position)
      piece = chessboard.get_piece_at(start_position)
      if piece && piece.color == current_turn
        chessboard.move_piece(start_position, end_position)
        switch_turn
      else
        "Invalid move or Not your turn"
      end
    end

    private

    def switch_turn
      @current_turn = current_turn == :white ? :black : :white
    end
  end
end
