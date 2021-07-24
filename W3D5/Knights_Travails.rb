require "tree"

class KnightPathFinder
    def initialize(pos)
        @grid = (0..7).map{|i| [i].product([0,1,2,3,4,5,6,7])}
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [] # positions we don't want to go into

    end

    def valid_moves(pos)
        # @pos check if moves -> 3 && 1 to the right doesn't go off the board
        # Answer should return up to 4 * 2 total positions
        starting_pos = pos
        result = []

        right_down = @grid[pos[0]+3][pos[1]+1]
        
        left_up = @grid[pos[0]-3][pos[1]-1]
        left_down = @grid[pos[0]-3][pos[1]+1]

        
        down_left = @grid[pos[0]-1][pos[1]+3]
        down_right = @grid[pos[0]+1][pos[1]+3]

        result << right_down if right_down

        right_up = @grid[pos[0]+3][pos[1]-1]
        down_right = @grid[pos[0]+1][pos[1]-1]
        up_right = @grid[pos[0]+1][pos[1]+3]
        
        
        short_left_up = @grid[pos[0]-1][pos[1]-3]
        result << short_left_up if short_left_up
        #
        
        short_right_up = @grid[pos[0]+1][pos[1]-3]
        result << short_right_up if short_right_up
        

        long_left_up = @grid[pos[0]-3][pos[1]+3]
        result << long_left_up if long_left_up
        
        long_right_up = @grid[pos[0]-3][pos[1]-1]
        result << long_right_up if long_right_up
        
    end

    def new_move_positions(starting_pos)
        
    end

    def build_move_tree
        # return a PolyTreeNode of possible positions that are valid

    end

end

