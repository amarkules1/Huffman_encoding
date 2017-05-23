require_relative 'my_min_heap'
require_relative 'my_node'
class MyHuffman
  attr_accessor :string, :hash, :minHeap, :encodedString, :encodeKey
  def initialize string
    @string = string
    @hash = count_frequencies @string
    @minHeap = huffman @hash
    @encodedString = encode_string @hash, @string

  end
  def count_frequencies string
    letters = string.scan /\w/
    frequencies = Array.new (letters.size)
    i = 0
    while i < frequencies.size
      frequencies[i] = 1
      i = i + 1
    end
    i = 0
    while i<letters.size
      found = false
      j = letters.size
      j = j - 1
      while (j>i)
        if letters[i] == letters[j]
          frequencies[i] = frequencies[i]+1
          frequencies.delete_at j
          letters.delete_at j
        end
        j = j-1
      end
      i = i+1
    end
    k=0
    hash = Array.new(frequencies.length)
    while k<letters.length
      arr = [frequencies[k],letters[k]]
      hash[k] = arr
      k = k + 1
    end
    return hash
  end
  def huffman hash
    @minHeap = MyMinHeap.new
    i = hash.size
    i = i - 1
    while i > -1
      arr = hash[i]
      @minHeap.addNode arr[1], arr[0]
      i = i-1
    end
    return @minHeap
  end
  def encode_string tree, string
    endString = ""
    i = 0
    while i<string.length
      index = @minHeap.searchHeap string[i], @minHeap.getRoot
      endString = endString + " " + @minHeap.getNode(index).getCode(@minHeap.getSize)
      i = i+1
    end
    return endString
  end
end