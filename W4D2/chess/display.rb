require_relative "board.rb"
require_relative "pawn.rb"

class Display

    def initialize(board)
        @board = board
    end

    def render
        p '---------------'
        @board.rows.each do |row|
            string = ""
            row.each do |element|
                if element.is_a?(Piece)
                    string += element.to_s + " "
                else
                    string += "#{element} "
                end

            end
            p string

        end
        p '---------------'
    end
        

end
board = Board.new
display = Display.new(board)

pawn1 = Pawn.new("w",0, board)
pawn2 = Pawn.new("w",0, board)

board.add_piece(pawn1, [1,5])
board.add_piece(pawn2, [2,4])
display.render

board.move_piece(pawn1, [1,5],[2,6])
display.render

