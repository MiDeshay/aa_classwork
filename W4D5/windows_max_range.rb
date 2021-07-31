def windowed_max_range(array, window)
    current_max_range = nil

    (0..array.length-window).each do |idx| # n
        segment = array[idx...(idx+window)]
        max = segment.max # m
        min = segment.min # m
        range = max - min
        
        current_max_range = range if current_max_range.nil?
        current_max_range = range if range > current_max_range
    end

    current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 



