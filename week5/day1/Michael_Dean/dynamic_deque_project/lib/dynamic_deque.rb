require_relative "deque"

class DynamicDeque < Deque
  
  attr_reader :max_volume

  def initialize(n)
    @max_volume = n
    super()
  end

  def middle
    return [] if blank?
   if size.even?
    @concealed_array[((size/2)-1)..(size/2)]
   else
   [ @concealed_array[size/2]]
   end
  end

  def push_back(*args)
    raise 'deque is full' if args.length + size > max_volume
    args.each{|arg| @concealed_array << arg}
    size
  end

  def pop_front(n=1)
    result = []
    n.times do
    result << super()
    end
   result
  end

end