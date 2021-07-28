require_relative 'nullpiece.rb'
require_relative 'piece.rb'

class Board

    attr_reader :rows

    def initialize 
        @rows = Array.new(8) {Array.new(8, 0)}
        #remember to do Null Piece / Remember to replace 0 with null piece
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def move_piece(piece, start_pos, end_pos)
        #p self[start_pos]
        #Replace 0 with null piece
        if self[start_pos] != 0
            if piece.valid_move?(end_pos)
                self[start_pos] = 0
                self[end_pos] = piece
                piece.position = end_pos
            end
        end
    end

    def add_piece(piece, position)
        self[position] = piece
        piece.position = position

    end
end