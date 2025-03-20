require './lib/node'

describe Node do
  let(:test_node) { Node.new }
  describe '#create_node' do
    it 'has the value set' do
      expect(test_node.value).to be_nil
    end
    it 'has next_node of nil' do
      expect(test_node.next_node).to be_nil
    end
  end
end
