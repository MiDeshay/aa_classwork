
require_relative "my_stack.rb"


class MinMaxStack < MyStack

    def initialize
        @stack = MyStack.new
        @max = []
        @min = []
    end

    def push(ele)
        @max << ele if ele > @max.last || @max.last.nil?
        @min << ele if ele < @min.last || @min.last.nil?
        @stack.push(ele)
    end

    def max
        @max.last
    end

    def min
        @min.last
    end
end