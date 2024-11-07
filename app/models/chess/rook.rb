module Chess
  class Rook < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      return false unless start_x == end_x || start_y == end_y

      path_clear?(start_position, end_position, board)
    end
  end
end
