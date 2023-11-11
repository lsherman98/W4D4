require 'byebug'
require_relative 'my_queue'
# def windowed_max_range(arr, window_size)
#     current_max_range = 0
#     (0..arr.length - window_size).each do |i|
#         window = arr[i...i + window_size]
#         min = window.min
#         max = window.max
#         range = max - min
#         current_max_range = range  if range > current_max_range
#     end
#     return current_max_range
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8


def max_windowed_range(array, window_size)
    queue = MinMaxStackQueue.new
    best_range = nil

    array.each_with_index do |el, i|
        queue.enqueue(el)
        queue.dequeue if queue.size > window_size

        if queue.size == window_size
            current_range = queue.max - queue.min
            best_range = current_range if !best_range || current_range > best_range
        end
    end

    best_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p max_windowed_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p max_windowed_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p max_windowed_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
