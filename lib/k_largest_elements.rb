require_relative 'heap'
require_relative 'heap_sort'

def k_largest_elements(array, k)
  array.heap_sort!.reverse!

  array.take(k)
end
