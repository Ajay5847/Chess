module Chess
  class King < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_pos
      end_x, end_y = end_pos

      # King moves one square in any direction
      (start_x - end_x).abs <= 1 && (start_y - end_y).abs <= 1
    end
  end
end
