require_relative 'piece.rb'
require_relative "pawn.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "knight.rb"
require_relative "king.rb"

class Board

    attr_reader :rows

    def initialize 
        @rows = Array.new(8) {Array.new(8, ".")}
        #remember to do Null Piece / Remember to replace 0 with null piece
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
    
        if self[start_pos] != '.'
            if self[start_pos].valid_move?(end_pos)
                if self[end_pos].is_a?(Piece) && self[end_pos].color != self[start_pos].color
                    self[end_pos] = '.'
                elsif self[end_pos].is_a?(Piece) && self[end_pos].color == self[start_pos].color
                    return nil
                end
                self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
                self[end_pos].position = end_pos
            end
        end
    end

    def add_piece(piece, position)
        self[position] = piece
        piece.position = position
    end

    def set_board
        self.rows.each.with_index do |row, i|
            if i == 6 || i == 1
                if i == 1
                    color = "black"
                else
                    color = "white"
                end
                (0...8).each do |j|
                    pawn = Pawn.new(color, 0, self)
                   self.add_piece(pawn, [i,j] )
                end
            elsif i == 0 || i == 7
                if i == 0
                    color = "black"
                else
                    color = "white"
                end
                (0...8).each do |j|
                    if j == 0 || j == 7
                        rook = Rook.new(color, 0, self)
                        self.add_piece(rook, [i,j] )
                    elsif j == 1 || j == 6
                        knight = Knight.new(color, 0, self)
                        self.add_piece(knight, [i,j])
                    elsif j == 2 || j == 5
                        bishop = Bishop.new(color, 0, self)
                        self.add_piece(bishop, [i,j])
                    elsif j == 3
                        queen = Queen.new(color, 0, self)
                        self.add_piece(queen, [i,j])
                    elsif j == 4
                        king = King.new(color, 0, self)
                        self.add_piece(king, [i,j])
                    end
                end
            end

        end
    end
end