class Queue

    def initialize
        @line = []
    end

    def enqueue(el) 
        @line << el
    end

    def dequeue 
        @line.shift
    end

    def peek
        @line[0]
    end

end