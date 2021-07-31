require_relative "my_stack.rb"

class MyStackQueue

    def initialize
        @push_stack = MyStack.new
        @pop_stack = MyStack.new
    end
    
    #stack1 [3,2,1] <- top of the stack front of the queue
    #stack2 [4,5]   <- top of the stack end of the queue


    #enequeue
    #stack1 [3,2,1,0]
    #stack2 [4,5]

    #dequeue
    #stack1 [3,2,1,0]
    #stack2 [4]

    #queue [1,2,3,4,5]

    def enqueue(ele)
        @push_stack.push(ele)
    end

    def dequeue
        @pop_stack.push(@push_stack.pop) until @push_stack.empty?
        @pop_stack.pop
    end

    def size
        @pop_stack.count + @push_stack.count
    end

    def empty?
        @pop_stack.empty? && @push_stack.empty?
    end



end

test = MyStackQueue.new
test.enqueue(1)
test.enqueue(2)
test.enqueue(3)

p test.dequeue