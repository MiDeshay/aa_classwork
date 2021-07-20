class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    # arr.each { |ele| puts "taco" }

    def my_select(&prc)
       true_eles = []
       self.my_each do |ele| 
        true_eles << ele if prc.call(ele)
       end
       true_eles
    end

    def my_reject(&prc)
        false_eles = []
        self.my_each do |ele|
            false_eles << ele unless prc.call(ele)
        end
        false_eles
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        false

    end

    def my_all?(&prc)
        self.my_each {|ele| return false unless prc.call(ele)}
        true
    end

    def my_flatten
        arr = []
        self.each do |el|
            if el.is_a?(Array)
                arr += el.my_flatten
            else
                arr += [el]
            end
        end

        # += vs <<
        # arr = arr + arr2

        arr
    end

    def my_zip(*arrs)
        zipped = []

        self.length.times do |i|
            subzipped = [self[i]]

            arrs.each do |arr|
                subzipped << arr[i]
            end
            zipped << subzipped
        end

        zipped
    end

    def my_rotate(rotate=1)
        rotation_index = rotate % self.length
        self.drop(rotation_index) + self.take(rotation_index)

        # arr.drop(n) returns arr without first n eles
        # arr.take(n) returns first n eles
    end

    def my_join(delimiter="")
        new_str = ""
        self.each_with_index do |char, i|
            unless i == self.length-1
                new_str += char + delimiter
            else
                new_str += char
            end
        end
        new_str
    end

    def my_reverse
        reverse = []
        self.reverse_each do |el|
            reverse << el
        end

        reverse
    end
end

positive = Proc.new{|num| num > 0}

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# p [-1,-2,1,2,-3,4,5].my_select(&positive)
#  p [-1,-2,1,2,-3,4,5].my_reject(&positive)
#  p [-1,-2,1,2,-3,4,5].my_any?(&positive)
#  p [-1,-2,1,2,-3,4,5].my_all?(&positive)

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

doubler = Proc.new { |num| num * 2}
# p [1, 2, 3].my_each(&doubler)

