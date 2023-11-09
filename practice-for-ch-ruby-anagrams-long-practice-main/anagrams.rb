def first_anagram(string1, string2)   #factorial
    array  = string1.chars.permutation(string1.length).to_a  
    array.include?(string2.chars)
    
end

p first_anagram("hello", 'oll')   # n^2 quadratic  

def second_anagram(string1, string2)
    string.each_char do |char|
        index = string2.index(char)
        if index
            string2.delete_at(index)
        else  
            return false  
        end         
    end    
    string2.empty?
end   

p first_anagram("hello", 'el')

def third_anagram(string1, string2)    #linear aka O(n)
    string1.sort!
    string2.sort!
    string1 == string2  

end  
p first_anagram("hello", 'elhlo')  #  linear 0(n)

def fourth_anagram(string1, string2)
hash1 = Hash.new(0)
hash2 = Hash.new(0)
string1.each_char {|char| hash1[char] +=1}
string2.each_char {|char| hash2[char] +=1}
hash1 == hash2
end     

p fourth_anagram("hello", 'ello')  

