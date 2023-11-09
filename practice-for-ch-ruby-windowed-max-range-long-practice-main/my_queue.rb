class MyQueue 
    def initialize 
        @queue = []
    end    

    def peek 
        @queue.last 
    end  
    
    def size 
        @queue.size 
    end    

    def empty?
        @queue.size == 0
    end
    
    def enqueue 
        @queue.unshift 
    end    

    def dequeue  
        @queue.pop
    end
end    


class MyStack 
    def initialize
        @queue = []
    end    

end    