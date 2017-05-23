class MyNode
  attr_accessor :parent, :leftChild, :rightChild, :letter, :frequency, :index, :code
  def initialize letter = nil, frequency=nil
    @letter = letter
    @frequency = frequency
    @parent = nil
    @leftChild = nil
    @rightChild = nil
    @index = 0
    @code = nil

  end
  def getCode size
    @code = ""
    ind = size - @index - 1
    while(ind>1)
      if ind%2 == 1
        @code = "1" + @code
      end
      if ind%2 == 0
        @code = "0" + @code
      end
      ind = ind/2
    end
    if ind == 1
      @code = "1"+@code
    end
    if ind == 0
      @code = "0"+@code
    end
    return @code
  end
  def setCode code
    @code = code
  end
  def setLetter letter
    @letter = letter
  end
  def setFrequency frequency
    @frequency = frequency
  end
  def setParent parent
    @parent = parent
  end
  def setIndex index
    @index = index
  end
  def getIndex
    return @index
  end
  def setLeftChild leftchild
    @leftChild = leftchild
  end
  def setRightChild rightchild
    @rightChild = rightchild
  end
  def getLetter
    return @letter
  end
  def getFrequency
    return @frequency.to_i
  end
  def getParent
    return @parent
  end
  def getLeftChild
    return @leftChild
  end
  def getRightChild
    return @rightChild
  end
  def removeLetter
    @letter = nil
  end
  def removeFrequency
    @frequency = nil
  end
  def removeParent
    @parent = nil
  end
  def removeLeftChild
    @leftChild = nil
  end
  def removeRightChild
    @rightChild = nil
  end
  def isRoot
    if @parent == nil
      return true
    else
      return false
    end
  end

end