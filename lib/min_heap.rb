class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    # if odd is being added to the right
    # if even is being added to the left 
    @store << HeapNode.new(key, value)

    heap_up(@store.length - 1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    if @store.empty? 
      return nil 
    end 

    swap(0, @store.length - 1)
    result = @store.pop

    heap_down(0) unless @store.empty? 
    return result.value
      

  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    return @store.empty?
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index) # last index first time 
    parent = (index - 1) / 2
    bottom = @store[index]

    if index > 0 && @store[parent].key > bottom.key 
      swap(index, parent)
      heap_up(parent)
    end 
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    
    max_length = @store.length - 1 
    child_left = index * 2 + 1
    child_right = index * 2 + 2
    top = @store[index]
    
    if index <= max_length 
      if !@store[child_left].nil? && top.key > @store[child_left].key
        heap_down(child_left)
        swap(index, child_left)
        
      elsif !@store[child_right].nil? && top.key > @store[child_right].key 
        swap(index, child_right)
        heap_down(child_left)
      end 
    end 
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end