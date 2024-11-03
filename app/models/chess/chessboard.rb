module Chess
  class Chessboard
    attr_accessor :board

    def initialize
      @board = Array.new(8) { Array.new(8) }
      setup_board
    end

    def setup_board
      @board[0][0] = Rook.new(:white, [ 0, 0 ])
      @board[0][7] = Rook.new(:white, [ 0, 7 ])
      @board[7][0] = Rook.new(:black, [ 7, 0 ])
      @board[7][7] = Rook.new(:black, [ 7, 7 ])

      # Similar for all
    end

    def move_piece(start_position, end_position)
      piece = get_piece_at(start_position)
      if piece && piece.valid_move?(start_position, end_position, @board)
        update_board(start_position, end_position, piece)
      else
        "Invalid Move"
      end
    end

    def get_piece_at(position)
      x, y = position
      @board[x][y]
    end

    private

    def update_board(start_position, end_position, piece)
      start_position_x, start_position_y = start_position
      end_position_x, end_position_y = end_position
      @board[start_position_x][start_position_y] = nil
      @board[end_position_x][end_position_y] = piece
      peice.move_to(end_position)
    end
  end
end
