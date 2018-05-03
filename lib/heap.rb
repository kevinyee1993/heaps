class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @prc = prc
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
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
