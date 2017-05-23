require_relative"../my_node"
class NodeSpec
  describe "Node Object" do
    before :each do
      @node = MyNode.new "letter", "2"
    end
    describe "#new" do
      it "returns a node object" do
        @node.should be_an_instance_of MyNode
      end
      it "throws an argument error for more than two arguments" do
        lambda { MyNode.new "letter", "1", "extra"}.should raise_exception ArgumentError
      end
    end
    describe "#letter" do
      it "returns the correct value" do
        @node.letter.should eql "letter"
      end
    end
    describe "#frequency" do
      it "returns the correct value" do
        @node.frequency.should eql "2"
      end
    end
    it "returns the frequency as an integer" do
      @node.getFrequency.should eql 2
    end
    it "allows the parent node to be set" do
      @node2 = MyNode.new "b", "4"
      @node.setParent @node2
      @node.getParent.should eql @node2
    end
    it "allows the root nodes to be set" do
      @node3 = MyNode.new "c", "3"
      @node.setLeftChild @node3
      @node.getLeftChild.should eql @node3
    end
    it "allows parent node to be deleted" do
      @node3 = MyNode.new "c", "3"
      @node.setParent @node3
      @node.removeParent
      @node.getParent.should eql nil
    end
    it "knows when the node is the root node" do
      @node.removeParent
      @node.isRoot.should eql true
    end
  end
end