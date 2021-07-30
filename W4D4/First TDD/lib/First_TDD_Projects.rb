class Array
  def my_uniq
    hash = {}
    self.each do |el|
      hash[el] = 1 if !hash.include?(el)
    end
    arr = []
    hash.each_key { |key| arr << key }
    arr
  end

  def two_sum
    arr = []
    (0...self.length).each do |idx1|
        (0...self.length).each do |idx2|
            if idx2 > idx1 
                arr << [idx1, idx2] if self[idx1] + self[idx2] == 0
            end
        end
    end
    arr
  end
end

def my_transpose(array)
    arr = []
    (0...array.length).each do |i|
      sub_arr = []
      array.each do |row|
        sub_arr << row[i]
      end
      arr << sub_arr
    end
    arr
end

def stock_picker(arr)
  array = []
  max_profit = 0
  arr.each_with_index do |price1, day1|
    arr.each_with_index do |price2, day2|
      if day2 > day1
        diff = price2 - price1
        if diff > max_profit
          max_profit = diff
          array = [day1, day2]
        end
      end
    end
  end
  array
end

class TowersOfHanoi

  attr_reader :stack1, :stack2, :stack3

  def initialize (arr1, arr2, arr3)
    @stack1 = arr1
    @stack2 = arr2
    @stack3 = arr3
  end

  def move(arr)
    start, ending = arr
    if start == 0
      return false if stack1.empty? 
    elsif start == 1
      return false if stack2.empty? 
    else
      return false if stack3.empty? 
    end

    if start == 0
      
    elsif start == 1
      
    else
      
    end
  end
end