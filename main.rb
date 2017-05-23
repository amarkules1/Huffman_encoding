require_relative 'my_huffman'
require_relative 'my_min_heap'
require_relative 'my_node'
class Main
  huff = MyHuffman.new "abcdefgggecddd"
  puts huff.encodedString
end