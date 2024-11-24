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

    # Convert the board with pieces into a savable format (array of hashes or nils)
    def board_to_array
      chessboard.board.map do |row|
        row.map do |piece|
          if piece
            { type: piece.class.name.split("::").last, color: piece.color, position: piece.position }
          else
            nil
          end
        end
      end
    end

    # Load board state from a serialized array format (stored in the database)
    def load_board_state(board_array)
      chessboard.board = board_array.map do |row|
        row.map do |piece_data|
          if piece_data
            piece_class = Object.const_get("Chess::#{piece_data[:type]}")
            piece_class.new(piece_data[:color].to_sym, piece_data[:position])
          else
            nil
          end
        end
      end
    end

    private

    def switch_turn
      @current_turn = current_turn == :white ? :black : :white
    end
  end
end
