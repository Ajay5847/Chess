module Chess
  class Piece
    attr_reader :color, :position

    def initialize(color, position)
      @color = color
      @position = position
    end

    def move_to(new_position)
      @position = new_position
    end

    def valid_move?(start_position, end_position, board)
      raise NotImplementedError, "Define this in each piece subclass"
    end

    def path_clear?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      # Check horizontal path (same row)
      if start_y == end_y
        range = start_x < end_x ? (start_x + 1...end_x) : (end_x + 1...start_x)
        range.each do |x|
          return false if board[x][start_y].present?
        end

      # Check vertical path (same column)
      elsif start_x == end_x
        range = start_y < end_y ? (start_y + 1...end_y) : (end_y + 1...start_y)
        range.each do |y|
          return false if board[start_x][y].present?
        end

      # Check diagonal path
      elsif (end_x - start_x).abs == (end_y - start_y).abs
        x_step = end_x > start_x ? 1 : -1
        y_step = end_y > start_y ? 1 : -1

        current_x = start_x + x_step
        current_y = start_y + y_step

        while current_x != end_x && current_y != end_y
          return false if board[current_x][current_y].present?
          current_x += x_step
          current_y += y_step
        end
      end

      true
    end
  end
end
