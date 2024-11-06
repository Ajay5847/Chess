module Chess
  class Rook < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      return false unless start_x == end_x || start_y == end_y

      path_clear?(start_position, end_position, board)
    end

    private

    def path_clear?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      # Horizontal Search
      (start_x..end_x).each do |position|
        return false if @board[start_x][position].present? && position != end_x
      end

      # Vertical Search
      (start_y..end_y).each do |position|
        return false if @board[position][start_y].present? && position != end_y
      end

      true
    end
  end
end
