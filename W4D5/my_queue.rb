class MyQueue
    def initialize
        @u_array = []
    end

    def enqueue(ele)
        @u_array << ele
    end

    def dequeue
        @u_array.shift
    end

    def peek
        @u_array.first
    end

    def size
        @u_array.count
    end

    def empty?
        @u_array.empty?
    end

end