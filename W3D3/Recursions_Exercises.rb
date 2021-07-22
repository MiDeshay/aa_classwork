
def range(start, max)
    return [] if max < start + 1
    range(start, max-1) + [max - 1]
end 


def iterative_sum(arr)
    sum = 0
    arr.each do |n|
        sum += n
    end
    sum
end

def recursive_sum(arr)
    return 0 if arr.empty?
    return arr.first if arr.length <= 1

    arr[0] + recursive_sum(arr[1..-1])
end


def exp1(b, n)
    return b if n <= 1

    b * exp1(b, n - 1)
end

# p exp1(2, 3)

def exp2(b, n)
    return 1 if n == 0
    return b if n == 1

    if n % 2 == 0
        exp2(b, n/2) ** 2
    else
        b * (exp2(b, (n-1)/2) ** 2)
    end
end

# p exp2(1, 0)
# p exp2(1, 1)
# p exp2(1, 2)
# p exp2(2, 0)
# p exp2(2, 1)
# p exp2(2, 2)


#We want too create a a copy of the array and all sub arrays
#but we want those arrays to have different object ids (to be seprate)

# 
# arr 1 = [1, [2], [3, [4]]]
#arr 2 = arr 1.dup
#arr 2 << 5

#arr 1 = [1, [2], [3, [4]]]
#arr 2 = [1, [2], [3, [4]], 5]


#deep dup looks at the each elemenr of the array and if it is an integer/char/
#immutable object, then it adds it to a new array.
#But if it is an array, it makes a copy of that array and iterates through
#the original. When it reaches an immutable object in that array, it adds
#it to the copy. When it reaches the end of the array it returns the last 
#element

# base case: we've reached something that is not an array
    #so we return it to be added to our final array

#recursive step: if the element is an array and its length is one 

#[2] => 2
#[[2]] => [2] => 2 => [2] => [[2]]

#[3, [4]]

# [1,2,3,4].dup


class Array
    def deep_dup
        deep_duplicates = []
        self.each do |ele|
            if !ele.is_a?(Array)
                deep_duplicates << ele
            else
                deep_duplicates << ele.deep_dup
            end
        end
        deep_duplicates
    end
end

# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34

def fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    
    fibs = fib(n-1)
    fibs << fib(n-1)[-1] + fib(n-1)[-2] 
end



#Binary Search

#base case
#if the array.length == 1 and arr[0] != target, then return nil
#find middle element length of array/2
#compare target to middle el
    #if its the same, return the index



#recursive step
#else
#split the array into array with lower value els and higher value els
#if target is smaller call on lower val arr
#if target is higher call on higher val arr

def bsearch(arr, target)
    return nil if arr.length == 1 && arr[0] != target
    mid_i = arr.length / 2
    return mid_i if arr[mid_i] == target

    low_arr = arr[0...mid_i]
    high_arr = arr[mid_i+1..-1]

    if arr[mid_i] > target
        bsearch(low_arr, target) 
    elsif bsearch(high_arr, target) != nil
       low_arr.length + 1 + bsearch(high_arr, target)
    end

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

#Merge Sort

#base Case
#if the the current element has an array length of 2 
#we use merge the arr[0] and arr[1]

#if the current element has an array length of 1, return arr[0]


#Recursive Step
#divide the current array into two parts and add them together
#call merge_sort on both

#Merge Helper Method
#  takes two numbers and returns an array where the
#   smaller element is first and the larger element is second

# def merge (left, right)
#     merged_array = []

#     until left.empty? || right.empty?
#         if left.first < right.first
#             merged_array << left.shift
#         else
#             merged_array << right.shift
#         end

#     end

#    merged_array + left + right
# end

def merge_sort(array)
    p array
    return array if array.length < 2

    mid_i = array.length / 2
    left_arr = array[0...mid_i]  
    right_arr = array[mid_i..-1]   

    sorted_left = merge_sort(left_arr)
    sorted_right = merge_sort(right_arr)

    merge(sorted_left, sorted_right)

end

def merge (left, right)
    merged_array = [] 
    
    until left.empty? || right.empty?
        if left.first < right.first
            merged_array << left.shift
        else
            merged_array << right.shift
        end

    end

   merged_array + left + right
end


#Array Subsets

#Base case
#if array is empty, return the array in another array
#case 1: if array.empty?, return [[], [num1]]


def subsets(arr)
    return [[]] if arr == [] 

    new_arr = []
    last = arr[-1]
    subset = subsets(arr[0..-2])

    subset.each do |suba|
        new_arr << suba + [last]
    end
    
    subset + new_arr

end

#permutations

#p([1]) => [1]
#p([1,2]) => [[1,2], [2,1]]
#p([1,2,3]) => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
# 
# Permutations iterates through the array takes the first element and 
# return a combination of it with the other elements 

# take and hold the first element
# take the rest of the elements 
# Combine the first and the rest and add it to an array
# rotate the rest
# Combine them and add them 

# take out the element at index loop number - 1
# move that number to the front of the original array
# take that first element

#var = arr[0]
#rest = arr[1..-1]
#rest.rotate



