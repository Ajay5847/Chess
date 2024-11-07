module Chess
  class Knight < Piece
    def valid_move?(start_position, end_position, board)
      start_x, start_y = start_position
      end_x, end_y = end_position

      # Knight moves in an "L" shape: two squares in one direction and one in the perpendicular
      (start_x - end_x).abs == 2 && (start_y - end_y).abs == 1 ||
      (start_x - end_x).abs == 1 && (start_y - end_y).abs == 2
    end
  end
end
