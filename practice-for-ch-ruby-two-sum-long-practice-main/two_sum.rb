def two_sum?(arr, target_sum) #n^2
  (0...arr.length).each do |i|
    (i+1...arr.length).each do |j|
        return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false


def okay_two_sum?(nums, target) #n log n
  nums.sort!
  i = 0
  j = nums.length - 1
  while i != j
    sum = nums[i] + nums[j]
    return true if sum == target
    sum > target ? j -= 1 : i += 1
  end
  false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 8)


def okay_two_sum_hash?(nums, target) # O(n)
  num_hash = {}
  nums.each.with_index do |num, i|
    if num_hash[target - num]
      return [num_hash[target - num], i]
    end
    num_hash[num] = i
  end
  false
end

# arr = [0, 1, 5, 9, 3]
# p okay_two_sum_hash?(arr, 11)
