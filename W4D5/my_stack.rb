class MyStack
    def initialize
        @u_array = []
    end
        
    def push(ele)
        @u_array << ele
    end

    def pop
        @u_array.pop
    end

    def peek
        @u_array.last
    end

    def size
        @u_array.count
    end

    def empty?
        @u_array.empty?
    end
end