def my_min_itr(list)
  list.each do |num1| #0
    return num1 if list.all? {|num2| num1 <= num2}
  end
end

def my_min(list)
  list.reduce do |acc, num|
    acc < num ? acc : num
  end
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min_itr(list)
# p my_min(list)


def largest_contiguous_subsum(list)
  sub_arrays = []
  (0...list.length).each do |i|
    (i...list.length).each do |j|
      sub_arrays << list[i..j].sum
    end
  end
  sub_arrays.max
end


# list = [5, 3, -7]
# p largest_contiguous_subsum(list)
#

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

def largest_sub_sum(list)
  current_sum = 0
  largest_sum = list.first

  list.each do |num|
   current_sum = 0 if current_sum < 0
   current_sum += num
   largest_sum = current_sum if current_sum > largest_sum
  end
  largest_sum
end

list = [5, 3, -7]
# p largest_sub_sum(list)
