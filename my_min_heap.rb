require_relative 'my_node'
class MyMinHeap
  attr_accessor :size, :root
  def initialize root = nil
    @root = root
    @size = 0
  end
  def getNode index
    node = @root
    while index > 0
      if index%2 == 0
        node = node.getRightChild
        index = (index - 2)/2
      end
      if index%2 == 1
        node = node.getLeftChild
        index = (index-1)/2
      end
    end
    return node
  end
  def addNode letter, frequency
    node = MyNode.new letter, frequency



    if @size==0
      @root = node
      @root.setIndex 0
    end
    if size > 0
      node.setIndex @size
      if size%2 == 0
        parent = getNode((size-2)/2)
        node.setParent(parent)
        parent.setRightChild node

      end
      if size%2 ==1
        parent = getNode((size-1)/2)
        node.setParent(parent)
        parent.setLeftChild node
      end
      while node.getParent != nil && node.getFrequency < node.getParent.getFrequency
        swap node, node.getParent
      end
    end

    @size = @size+1
  end
  def getRoot
    return @root
  end
  def getSize
    return @size
  end
  def swap node1, node2
    freq = node1.getFrequency
    lett = node1.getLetter
    node1.setFrequency(node2.getFrequency)
    node1.setLetter(node2.getLetter)
    node2.setFrequency(freq)
    node2.setLetter(lett)
  end
  def searchHeap letter, node
    index = nil
    if node.getLetter == letter
      return node.getIndex
    end
    if node.getLeftChild != nil
      index = searchHeap letter, node.getLeftChild
      if index != nil
        return index
      end
    end
    if node.getRightChild != nil
      index = searchHeap letter, node.getRightChild
      if index != nil
        return index
      end
    end
    return nil
  end
end