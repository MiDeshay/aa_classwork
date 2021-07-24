class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end
    
    def value
        @value
    end

    def parent=(node)
        if @parent != node
            if node != nil
                node.children << self 
            end

            if @parent != nil
                @parent.children.delete(self)
            end
        end
        @parent = node
    end

    def add_child(child_node)
        child_node.parent= self
    end 

    def remove_child(child_node) 
        if !@children.include?(child_node)
            raise "error"
        end
        child_node.parent= nil
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            result = child.dfs(target_value)
            return result unless result == nil
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            el = queue.shift
            if el.value == target_value
                return el
            else
                queue += el.children
            end
        end
    end


end


if __FILE__ == $PROGRAM_NAME

    parent = nil
    child_1 = PolyTreeNode.new("child_1")
    child_2 = PolyTreeNode.new("child_2")

    child_2.parent = parent


    child_2.parent = nil
    puts child_2.parent == nil
    

end
