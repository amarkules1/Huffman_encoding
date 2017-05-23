require_relative "spec_helper"

class HuffmanSpec
  describe "Huffman Object" do
    before :each do
      @myHuffman = MyHuffman.new "aabbbccdddd"


    end
    describe "#new" do
      it "is an instance of MyHuffman" do
        @myHuffman.should be_an_instance_of MyHuffman
      end
      it "throws an argument error for more than one argument" do
        lambda { MyHyffman.new "string", "extra"}.should raise_exception ArgumentError
      end
    end
    it "counts the frequencies of characters and puts them in a hash" do
      hash = @myHuffman.hash
      hash[3].should eql ["b"]
    end
    it "uses the hash to construct an encoding tree" do
      minHeap = @myHuffman.minHeap
      minHeap.getNode(0).should eql "c"
    end
    it "encodes a string as a series of bits" do
      @myHuffman.encode_string(@minHeap, "ccc").should eql "111"
    end
  end
end