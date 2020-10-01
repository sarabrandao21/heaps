

# This method uses a heap to sort an array.
# Time Complexity:  O(n log n)
# Space Complexity: O(n)
def heap_sort(list)
  heap_list = MinHeap.new
  result = []

  list.each do |num|
    heap_list.add(num)
  end
  
  i = 0
  while i < list.length
    removed = heap_list.remove() 
    result[i] = removed
    puts "#{result}"
    i += 1
  end

  return result
end