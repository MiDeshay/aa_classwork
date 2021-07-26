require_relative "tree"

class KnightPathFinder

    attr_reader :root_node



    def initialize(pos)
        @@grid = []
        (0..7).each do |n|
            arr = []
            (0..7).each do |num|
                arr << [n, num]
            end
            @@grid << arr
        end

        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos] # positions we don't want to go into
        build_move_tree

    end


    def self.valid_moves(pos)
        valid_moves = []

        # @@grid[pos[0]][pos[1]][0] gives "x" of position
        # @@grid[pos[0]][pos[1]][1] gives "y" of position




        positive = true

        8.times do |i|
            arr = []

            if i > 3
                inner_num = 2
                outer_num = 1

            else
                inner_num = 1
                outer_num = 2
            end

            if positive == true
                positive = false
            else
                inner_num *= -1
                positive = true
            end

            outer_nums_neg = [2,3,6,7]
            if outer_nums_neg.include?(i)
                outer_num *= -1
            end

            
            num = @@grid[pos[0]][pos[1]][0] + outer_num 
            if num >= 0 && num < 8
                num2 = @@grid[pos[0]][pos[1]][1] + inner_num
                
                if num2 >= 0 && num2 < 8
                    valid_moves << [num, num2]
                end
            end
          
        end

        valid_moves
        
        
    end

    def new_move_positions(starting_pos)
        new_move_positions = []
        valid_moves = KnightPathFinder.valid_moves(starting_pos)

        valid_moves.each do |valid_move|
            if !@considered_positions.include?(valid_move)
                new_move_positions << valid_move
                @considered_positions << valid_move
            end
        end

        new_move_positions
        
    end

    def build_move_tree
        

        queue = [self.root_node]
    
        until queue.empty?

            node = queue.shift

            positions = self.new_move_positions(node.value)

            positions.each do |position|
                new_node = PolyTreeNode.new(position)
                new_node.parent = node


                queue << new_node
            end
        end
        


    end

    def find_path(end_pos)
        queue = [self.root_node]

        until queue.empty?
            el = queue.shift
            
            return self.trace_path_back(el) if el.value == end_pos

            el.children.each do |child|
                queue << child
            end
        end
        nil

    end

    def trace_path_back(node)
        
        path = [node.value]
        arr = [node]

        until arr.last.parent.nil?
            el = arr.last
            arr << el.parent
            path.unshift(el.parent.value)
        end
        path
    end

    

    
end

test = KnightPathFinder.new([1,7])

p test.find_path([3,5])


