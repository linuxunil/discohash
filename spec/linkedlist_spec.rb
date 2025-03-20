require './lib/linkedlist'

describe LinkedList do
  describe '#inxitialize' do
    it 'creates new node with nil head' do
      linked_list = LinkedList.new
      expect { linked_list.head }.to raise_error 'Empty List'
    end
    it 'create new list with node value zero' do
      linked_list = LinkedList.new('zero')
      expect(linked_list.head).to eq 'zero'
    end
  end
  describe '#append' do
    linked_list = LinkedList.new
    context 'when list is empty' do
      it 'if list has no entrys make root node first entry' do
        linked_list.append('zero')
        expect(linked_list.head).not_to be_nil
        expect(linked_list.head).to eq 'zero'
      end
    end
    context 'when list is NOT empty' do
      linked_list = LinkedList.new('zero')
      it 'if list has entry add to the end' do
        expect(linked_list.head).to eq 'zero'
        linked_list.append('one')
        expect(linked_list.tail).to eq 'one'
      end
    end
  end
  describe '#prepend' do
    context 'when the list is empty' do
      linked_list = LinkedList.new
      it 'set root node to value' do
        expect { linked_list.head }.to raise_error('Empty List')
        linked_list.prepend('one')
        expect(linked_list.head).not_to be_nil
      end
    end
    context 'when the list is NOT empty' do
      linked_list = LinkedList.new
      it 'adds a new node to the beggining' do
        linked_list.prepend('zero')
        expect(linked_list.head).to eql 'zero'
      end
    end
  end
  # FIXME: Size doens't return sane value
  describe '#size' do
    it 'returns the total number of nodes in the list' do
      linked_list = LinkedList.new
      expect { linked_list.head }.to raise_error RuntimeError
      expect(linked_list.size).to eq 0
      linked_list.prepend('zero')
      expect(linked_list.size).to eq 1
      linked_list.append('one')
      expect(linked_list.size).to eq 2
      linked_list.append('two')
      expect(linked_list.size).to eq 3
      linked_list.pop
      expect(linked_list.size).to eq 2
    end
  end
  describe '#head' do
    it 'returns the first node in the list' do
      linked_list = LinkedList.new('zero')
      expect(linked_list.head).to eq 'zero'
    end
  end
  describe '#tail' do
    it 'returns teh last node in the list' do
      linked_list = LinkedList.new('zero')
      expect(linked_list.tail).to eq linked_list.head
      linked_list.append('one')
      expect(linked_list.tail).not_to eq linked_list.head
    end
  end
  describe '#at' do
    it 'returns the node at the given index' do
      linked_list = LinkedList.new('zero')
      linked_list.append('one')
      expect(linked_list.at(0).value).to eq linked_list.head
      expect(linked_list.at(1).value).to eq 'one'
    end
  end
  describe '#pop' do
    context 'when list is empty' do
      it 'return nil' do
        linked_list = LinkedList.new
        expect(linked_list.pop.value).to be_nil
      end
    end
    context 'when list is NOT empty' do
      it 'removes the last element' do
        linked_list = LinkedList.new('zero')
        expect(linked_list.pop.value).to eq 'zero'
      end
    end
  end
  describe '#contains?' do
    it 'returns true if the passed value is in the list and otherwise returns fasle.' do
      linked_list = LinkedList.new('zero')
      linked_list.append(1)
      linked_list.append(2)
      expect(linked_list.contains?(1)).to eq true
      expect(linked_list.contains?(3)).to eq false
      expect(linked_list.contains?('zero')).to eq true
    end
  end
  describe '#find' do
    it 'returns teh index of the node containing value, or nil if not found' do
      linked_list = LinkedList.new('zero')
      linked_list.append('one')
      linked_list.append('two')
      expect(linked_list.find('one')).to eq 1
      expect(linked_list.find('two')).to eq 2
    end
  end
  describe 'to_s' do
    it 'represent the list as string' do
      linked_list = LinkedList.new

      linked_list.append('dog')
      linked_list.append('cat')
      linked_list.append('parrot')
      linked_list.append('hamster')
      linked_list.append('snake')
      linked_list.append('turtle')
      expect(linked_list.to_s).to eq '( dog ) -> ( cat ) -> ( parrot ) -> ( hamster ) -> ( snake ) -> ( turtle ) -> nil'
    end
  end
end
