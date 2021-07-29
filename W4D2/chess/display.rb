require_relative "board.rb"
require_relative "pawn.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "knight.rb"
require_relative "king.rb"

class Display

    def initialize(board)
        @board = board
    end

    def render
        p '  0 1 2 3 4 5 6 7'
        @board.rows.each.with_index do |row, i|
            string = ""
            row.each do |element|
                if element.is_a?(Piece)
                    string += element.to_s + " "
                else
                    string += "#{element} "
                end

            end
            p "#{i} " + string 

        end
        p '---------------'
    end
        

end
board = Board.new
display = Display.new(board)

board.set_board
display.render
board.move_piece([6,3], [4,3])
display.render


