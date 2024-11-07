module Chess
  class Pawn < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position
      color = board[start_x][start_y].color

      direction = color == :white ? 1 : -1  # White moves up (positive direction), black moves down (negative direction)
      starting_row = color == :white ? 1 : 6

      # One square forward
      if end_x == start_x + direction && end_y == start_y
        board[end_x][end_y].nil?

      # Two squares forward from starting position
      elsif end_x == start_x + (2 * direction) && end_y == start_y && start_x == starting_row
        board[start_x + direction][start_y].nil? && board[end_x][end_y].nil?

      # Capture move (diagonal one square)
      elsif end_x == start_x + direction && (end_y == start_y + 1 || end_y == start_y - 1)
        board[end_x][end_y]&.color != color if board[end_x][end_y]  # Ensure it's an opponent's piece

      # Invalid move for a pawn
      else
        false
      end
    end
  end
end
