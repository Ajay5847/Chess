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
    end
  end
end
