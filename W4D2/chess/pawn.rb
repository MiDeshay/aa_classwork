require_relative "piece.rb"
class Pawn < Piece
    attr_reader :color, :position
    attr_accessor :position

    def initialize(color, position, board)
        super(color, position, board)
    end

    def valid_move?(end_pos, is_taking=false)
        #returns true or false if a pawn can be moved to a certain position
        row = position[0]
        col = position[1]

        ending_row = end_pos[0]
        ending_col = end_pos[1]

        if @color == "black" && row > ending_row
            return false
        elsif @color == "white" && row < ending_row
            return false
        end

        if (ending_row < 0 || ending_row > 7) || (ending_col < 0 || ending_col > 7)
            return false
        end

        if @board[end_pos].is_a?(Piece)
            if (end_pos[0] == row - 1 || end_pos[0] == row + 1) && (end_pos[1] == col - 1 || end_pos[1] == col + 1) && @board[end_pos].color != @color
                return true
            else
                return false
            end
        end

        if self.at_start_row?
            if (end_pos[0] == row - 2 || end_pos[0] == row + 2)  && end_pos[1] == col
                return true
            elsif (end_pos[0] == row - 1 || end_pos[0] == row + 1) && end_pos[1] == col
                return true
            else
                return false
            end
        end

        if (end_pos[0] == row - 1 || end_pos[0] == row + 1) && end_pos[1] == col
            return true
        else
            return false
        end
        

    end
    
    def symbol
        'p'
    end

    def take

    end

    def at_start_row?
        if position[0] == 1 || position[0] == 6
            return true
        else
            return false
        end
    end
end