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

        if @board[end_pos].is_a?(Piece)
            p "its a piece"
            if (end_pos[0] == row - 1 || end_pos[0] == row + 1) && (end_pos[1] == col - 1 || end_pos[1] == col + 1)
                return true
            else
                return false
            end
        end

        if self.at_start_row?
            if end_pos[0] == row - 2 || end_pos[0] == row + 2
                return true
            elsif end_pos[0] == row - 1 || end_pos[0] == row + 1
                return true
            else
                return false
            end
        end
        if end_pos[0] == row - 1 || end_pos[0] == row + 1
            return true
        else
            return false
        end
        

    end
    
    def symbol
        "p"
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