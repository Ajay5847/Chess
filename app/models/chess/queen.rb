module Chess
  class Queen < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_pos
      end_x, end_y = end_pos

      # Horizontal move (same row) or Vertical move (same column) or Diagonal move
      return false unless start_x == end_x || start_y == end_y || (end_x - start_x).abs == (end_y - start_y).abs

      path_clear?(start_position, end_position, board)
    end
  end
end
