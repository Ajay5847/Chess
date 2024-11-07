module Chess
  class Bishop < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      return false unless (end_x - start_x).abs == (end_y - start_y).abs

      path_clear?(start_position, end_position, board)
    end
  end
end
