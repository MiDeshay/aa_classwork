require_relative "piece.rb"

class Knight < Piece
    attr_reader :color, :position
    attr_accessor :position

    def initialize(color, position, board)
        super(color, position, board)
    end

    def symbol
        "N"
    end

    def valid_move?(end_pos)
        starting_row = position[0]
        starting_col = position[1]

        ending_row = end_pos[0]
        ending_col = end_pos[1]

        if (ending_row < 0 || ending_row > 7) || (ending_col < 0 || ending_col > 7)
            return false
        end


        if ending_row == starting_row + 2 
            if ending_col == starting_col + 1 || ending_col == starting_col - 1 
                return true
            end
        elsif ending_row == starting_row - 2 
            if ending_col == starting_col + 1 ||  ending_col == starting_col - 1 
                return true
            end
        elsif ending_col == starting_col + 2
            if ending_row == starting_row + 1 || ending_row == starting_row - 1 
                return true
            end
        elsif ending_col == starting_col - 2
            if ending_row == starting_row + 1 ||  ending_row == starting_row - 1 
                return true
            end
        end
        false
        
    end


end