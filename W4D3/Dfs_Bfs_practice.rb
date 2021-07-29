class Node 

    attr_reader :value, :children
    attr_writer :parent

    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    def add_parent(node)
        node.children << self
        self.parent = node
    end

    def add_child(node)
        self.children << node
        node.parent = self
    end

    def bfs(target_value, visited = [])
        queue = [self]

        until queue.empty?
            el = queue.shift

            return el if el.value == target_value

            visited << el

            el.children.each do |child|
                unless visited.include?(child)
                    queue << child
                end
            end
            nil
        end
    end

    def dfs(target_value, visited = [])
        return self if self.value == target_value

        visited << self
        self.children.each do |child|
            
            unless visited.include?(child)
                result = child.dfs(target_value, visited)
                return result if !result.nil?
            end
        end
        nil
    end

end

a = Node.new('a')

b = Node.new('b')
c = Node.new('c')

# d = Node.new('d')
# e = Node.new('e')
# f = Node.new('f')

a.add_child(b)
b.add_child(c)

c.add_child(a)
# e.add_parent(b)
# f.add_parent(c)

# p a.dfs('c').value
# p a.dfs('g')

p a.bfs('b').value
p a.bfs('0')

