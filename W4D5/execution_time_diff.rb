def my_min_quadratic(array) #[ 0, 3, 5, 4, -5, 10, 1, 90 ]

  array.each do |num1|
    smallest = true
  
    array.each do |num2|
      smallest = false if num2 < num1
    end

    return num1 if smallest
  end
end
# What is the time complexity for this function? O(n^2)

def my_min_linear(array)
  min = array[0]

  array.each do |num|
    min = num if num < min
  end
  min
end

# What is the time complexity for this function? O(n)

def largest_contiguous_subsum(list)
  subsets = []
  (0...list.length).each do |idx1|
    (idx1...list.length).each do |idx2|
      subsets << list[idx1..idx2]
    end
  end

  #orignial [1,2,3]

  #[1]
  #[1,2]
  #[1,2,3]
  #[2]
  #[2,3]
  #[3]


  largest = subsets[0].sum
  subsets.each do |subset|
     largest = subset.sum if subset.sum > largest
  end

  largest
end

#what is the time complexity for this function? 

# p largest_contiguous_subsum([5,-7,3])   [1,2,3,-4,5,56,5]

def linear_subsum(arr)
  largest = arr[0] # 5
  current = 0 # -4

  (0...arr.length).each do |idx| # 1
    current += arr[idx]
    largest = current if current >= largest
    current = 0 if current < 0
  end
  largest
end
list = [2, 3, -6, 7, -6, 7]
list2 = [-5, -1, -3]
p linear_subsum(list)
p linear_subsum(list2)
