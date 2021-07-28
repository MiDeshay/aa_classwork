require_relative 'board.rb'

class Piece
    def initialize(color, pos, board)
        @color = color
        @pos = pos
        @board = board
    end

    def pos=(val)
        @pos = val
    end

    def to_s
        return symbol
    end
    

end