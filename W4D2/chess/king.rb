require_relative "piece.rb"

class King < Piece
    attr_reader :color, :position
    attr_accessor :position

    def initialize(color, position, board)
        super(color, position, board)
    end

    def symbol
        "K"
    end

    def valid_move?(end_pos)
        starting_row = position[0]
        starting_col = position[1]

        ending_row = end_pos[0]
        ending_col = end_pos[1]

        if (ending_row < 0 || ending_row > 7) || (ending_col < 0 || ending_col > 7)
            return false
        end

        if (starting_row + 1 == ending_row || starting_row - 1 == ending_row) && (starting_col + 1 == ending_col || starting_col - 1 == ending_col)
            return true
        elsif (starting_row + 1 == ending_row || starting_row - 1 == ending_row) && starting_col == ending_col
            return true
        elsif (starting_col + 1 == ending_col || starting_col - 1 == ending_col) && starting_row == ending_row
            return true
        end
        false
    end
end