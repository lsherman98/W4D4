class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.size
    end

    def empty?
        @store.size == 0
    end

    def enstore
        @store.unshift
    end

    def destore
        @store.pop
    end
end


class MyStack
    def initialize(store = [])
        @store = store
    end

    def peek
        @store.last
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(el)
        @store.push(el)
    end

end


class StackQueue
    def initialize
        @in_stack = MyStack.new
        @out_stack = MyStack.new
    end

    def size
        @in_stack.size + @out_stack.size
    end

    def empty?
        @in_stack.empty? && @out_stack.empty?
    end

    def enqueue(val)
        @in_stack.push(val)
    end

    def dequeue
        queueify if @out_stack.empty?
        @out_stack.pop
    end

    def queueify
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end
end

class MinMaxStack
    def initialize
        @store = MyStack.new
    end

    def peek
        @store.peek[:value] unless empty?
    end

    def size
        @store.size
    end

    def empty?
        @store.empty?
    end

    def max
        @store.peek[:max] unless empty?
    end

    def min
        @store.peek[:min] unless empty?
    end

    def pop
        @store.pop[:value] unless empty?
    end

    def push(val)
        @store.push({
            min: new_min(val),
            max: new_max(val),
            value: val
        })
    end

    private
    def new_min(val)
        empty? ? val : [min, val].min
    end

    def new_max(val)
        empty? ? val : [max, val].max
    end
end


class MinMaxStackQueue
    def initialize
        @in_stack = MinMaxStack.new
        @out_stack = MinMaxStack.new
    end

    def size
        @in_stack.size + @out_stack.size
    end

    def empty?
        @in_stack.empty? && @out_stack.empty?
    end

    def dequeue
        queueify if @out_stack.empty?
        @out_stack.pop
    end

    def enqueue(val)
        @in_stack.push(val)
    end

    def max
        maxes = []
        maxes << @in_stack.max unless @in_stack.empty?
        maxes << @out_stack.max unless @out_stack.empty?
        maxes.max
    end

    def min
        mins = []
        mins << @in_stack.min unless @in_stack.empty?
        mins << @out_stack.min unless @out_stack.empty?
        mins.min
    end

    private
    def queueify
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end
end
