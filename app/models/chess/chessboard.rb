module Chess
  class Chessboard
    attr_accessor :board

    def initialize
      @board = Array.new(8) { Array.new(8) }
      setup_board
    end

    def setup_board
      # Rook
      @board[0][0] = Rook.new(:white, [ 0, 0 ])
      @board[0][7] = Rook.new(:white, [ 0, 7 ])
      @board[7][0] = Rook.new(:black, [ 7, 0 ])
      @board[7][7] = Rook.new(:black, [ 7, 7 ])

      # Knight
      @board[0][1] = Knight.new(:white, [ 0, 1 ])
      @board[0][6] = Knight.new(:white, [ 0, 6 ])
      @board[7][1] = Knight.new(:black, [ 7, 1 ])
      @board[7][6] = Knight.new(:black, [ 7, 6 ])

      # Bishop
      @board[0][2] = Bishop.new(:white, [ 0, 2 ])
      @board[0][5] = Bishop.new(:white, [ 0, 5 ])
      @board[7][2] = Bishop.new(:black, [ 7, 2 ])
      @board[7][5] = Bishop.new(:black, [ 7, 5 ])

      # Queen
      @board[0][3] = Queen.new(:white, [ 0, 3 ])
      @board[7][3] = Queen.new(:black, [ 7, 3 ])

      # King
      @board[0][4] = King.new(:white, [ 0, 4 ])
      @board[7][4] = King.new(:black, [ 7, 4 ])

      # Pawns
      2.times.each do |i|
        pawn_index = i.zero? ? 1 : 6
        8.times.each do |j|
          @board[pawn_index][j] = Pawn.new(pawn_index == 1 ? :white : :black, [ pawn_index, j ])
        end
      end
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
