require_relative '../my_min_heap'
require_relative '../my_node'
require 'tree/binarytree'
class MinHeapSpec
  describe "minHeap object" do
    before :each do
      @minHeap = MyMinHeap.new
      @minHeap.addNode "a", "1"
      @minHeap.addNode "b", "3"
      @minHeap.addNode "c", "2"
      @minHeap.addNode "d", "4"
    end
    describe "#new" do
      it "is an instance of minHeap" do
        @minHeap.should be_an_instance_of MyMinHeap
      end
      it "throws an argument error for more than one argument" do
       lambda { MyMinHeap.new "string", "extra"}.should raise_exception ArgumentError
      end
    end

    describe "#root" do
      it "returns a node object" do
        @minHeap.root.should be_an_instance_of MyNode
      end
    end
    describe "#size" do
      it "returns the correct size of the heap" do
        @minHeap.size.should eql 4
      end
    end
    it "returns the node with a specified index" do
      @minHeap.getNode(0).letter.should eql "a"
    end
    it "adds a node in the correct place" do
      @minHeap.addNode "e", "0"
      @minHeap.getNode(0).letter.should eql "e"
    end

  end
end