require_relative "heap"

class Array
  def heap_sort!
    #need to use max heap sort
    prc = Proc.new{|el1, el2| el2 <=> el1}

    # max_heap = BinaryMinHeap.new(self, &prc)
    # p max_heap.store.heapify_down

    self.length.times do
      BinaryMinHeap.heapify_down(self, 0, self.length, &prc)
    end

    for i in 0..self.length - 1
      temp = self[0]
      self[0] = self[self.length - 1 - i]
      self[self.length - 1 - i] = temp


      BinaryMinHeap.heapify_down(self, 0, self.length - 1 - i, &prc)
    end


    self

    #in place heapify
    # for i in 0..self.length - 1


    # end

    #parents need to be larger than children


  end
end
