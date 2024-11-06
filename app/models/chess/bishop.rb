module Chess
  class Bishop < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      return false unless (end_x - start_x).abs == (end_y - start_y).abs

      path_clear?(start_position, end_position, board)
    end

    private

    def path_clear?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      x_step = end_x > start_x ? 1 : -1
      y_step = end_y > start_y ? 1 : -1

      current_x_position = start_x + x_step
      current_y_position = start_y + y_step

      while [ current_x_position, current_y_position ] != end_position
        return false if @board[current_x_position][current_y_position].present?

        current_x_position += x_step
        current_y_position += y_step
      end

      true
    end
  end
end
