def bad_two_sum?(array, target) # (n^2) time complexity
    (0...array.length).each do |i|
        (i + 1...array.length).each do |j|
            return true if array[i] + array[j] == target
        end
    end
    false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(array, target)
    array.sort!
    (1...array.length).each do |idx|
        return true if array[idx-1] + array[idx] == target
    end
    false
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(array, target)
    hash_map = Hash.new
    array.each do |ele|
        return true if hash_map[ele]
        hash_map[target - ele] = true
    end
    false
end

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false