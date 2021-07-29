module Slideable

    HORIZANTAL_DIRS = [[0,1], [1,0], [-1,0], [0,-1]]

    DIAGONAL_DIRS = [[1,1], [1,-1], [-1,1], [-1,-1]]



    def moves
        moves = []
        self.move_dirs.each do |direction|
            self.grow_unblocked_moves(direction)
            


        #iterates over move dirs and calls grow unblocked moves in each direction
        # returns all the moves that a piece can make given its move dirs
    end

    def grow_unblocked_moves([dx, dy])
        #takes in a direction, returns an array of all of the postions that a piece can
        #move to in that direction
        # [4,4] + [0,1] = [4, 5] 
        # new array << [4,5]
        unblocked_moves = []
        row = @position[0]
        col = @position[1]

        until @board[[row, col]].nil? || @board[[row, col]].is_a?(Piece)
            row += dx
            col += dy
            unblocked_moves << [row, col]
        end

        if @board[row,col].is_a?(Piece) && @board[row,col].color == self.color
            return unblocked_moves[0...-1]
        else
            return unblocked_moves[0..-1]
        end

    end

end