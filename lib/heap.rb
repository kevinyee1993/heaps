class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc
    @store = []
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    indices = []
    child1 = parent_index * 2 + 1
    child2 = parent_index * 2 + 2

    indices.push(child1) if child1 < len
    indices.push(child2) if child2 < len

    indices
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

#what to do with proc here just going to solve it without for now
  def self.heapify_down(array, parent_idx, len = array.length, &prc)

    prc ||= Proc.new{|el1, el2| el1 <=> el2}

    # while(parent_idx < len-1 && self.child_indices(len, parent_idx).length > 0)
    while(parent_idx < len - 1)

      children = self.child_indices(len, parent_idx)
      small_child = nil

      if children.length == 2
        # array[children[0]] < array[children[1]] ? small_child = children[0] : small_child = children[1]
        prc.call(array[children[0]], array[children[1]]) == -1 ? small_child = children[0] : small_child = children[1]
      elsif children.length == 1
        small_child = children[0]
      end

      if small_child == nil
        break
      end

      # if array[parent_idx] > array[small_child]
      if prc.call(array[parent_idx], array[small_child]) == 1
        temp = array[parent_idx]
        array[parent_idx] = array[small_child]
        array[small_child] = temp
      end
      # end

      parent_idx += 1
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new{|el1, el2| el1 <=> el2}


    # while(self.parent_index(child_idx))
    while(child_idx > 0)
      parent_idx = self.parent_index(child_idx)
      if(prc.call(array[parent_idx], array[child_idx]))
        temp = array[parent_idx]
        array[parent_idx] = array[child_idx]
        array[child_idx] = temp
      end

      child_idx = self.parent_index(child_idx)
    end

    array

  end


end
