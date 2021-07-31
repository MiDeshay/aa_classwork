def first_anagram?(string1, string2)
    str_arr = []
    (1..string1.length).each do |perm|
        str_arr += string1.chars.permutation(perm).to_a.map(&:join)
    end

    str_arr.include?(string2)
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives") 

# What is the time complexity of this solution? What happens if you increase the size of the strings? O(n!)

def second_anagram?(string1, string2)
    arr = string2.chars
    string1.each_char do |char|   # n     
        result = arr.index(char) # n
        arr.delete_at(result) unless result.nil? 
        
    end
    arr.empty? 
end

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram?? O(n^2)

p second_anagram?("gizmo", "sally")
p second_anagram?("elvis", "lives") 

def third_anagram?(string1, string2)
    string1.chars.sort == string2.chars.sort
end

# What is the time complexity of this solution? Is it better or worse than #second_anagram?? O(n logn), n logn is preferable to n^2

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives") 

def fourth_anagram?(string1, string2)
    s1_hash = Hash.new(0)
    s2_hash = Hash.new(0)

    (0...string1.length).each do |idx|
        char1 = string1[idx]
        char2 = string2[idx]

        s1_hash[char1] += 1
        s2_hash[char2] += 1
    end

    s1_hash == s2_hash

end

# What is the time complexity?? O(n)

# p fourth_anagram?("gizmo", "sally")
# p fourth_anagram?("elvis", "lives")

def fifth_anagram?(str1, str2)

    char_hash = Hash.new(0)
    (0...str1.length).each do |idx|
        char1 = str1[idx]
        char2 = str2[idx]

        char_hash[char1] += 1
        char_hash[char2] -= 1
    end

    char_hash.values.all?(&:zero?)

end

# p fifth_anagram?("gizmo", "sally")
# p fifth_anagram?("elvis", "lives")

