module Chess
  class Queen < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_pos
      end_x, end_y = end_pos

      # Horizontal move (same row) or Vertical move (same column) or Diagonal move
      start_x == end_x || start_y == end_y || (end_x - start_x).abs == (end_y - start_y).abs

      path_clear?(start_position, end_position, board)
    end

    private

    def path_clear?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      # Determine if the move is diagonal, vertical, or horizontal
      if start_x == end_x
        # Vertical movement
        y_step = end_y > start_y ? 1 : -1
        current_y = start_y + y_step

        while current_y != end_y
          return false if @board[start_x][current_y].present?
          current_y += y_step
        end

      elsif start_y == end_y
        # Horizontal movement
        x_step = end_x > start_x ? 1 : -1
        current_x = start_x + x_step

        while current_x != end_x
          return false if @board[current_x][start_y].present?
          current_x += x_step
        end

      elsif (end_x - start_x).abs == (end_y - start_y).abs
        # Diagonal movement
        x_step = end_x > start_x ? 1 : -1
        y_step = end_y > start_y ? 1 : -1
        current_x = start_x + x_step
        current_y = start_y + y_step

        while current_x != end_x && current_y != end_y
          return false if @board[current_x][current_y].present?
          current_x += x_step
          current_y += y_step
        end

      else
        return false
      end

      true
    end
  end
end
