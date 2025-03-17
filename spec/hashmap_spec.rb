# frozen_string_literal: true

require './lib/hashmap'
describe Hashmap do
  context 'hashing entries' do
    it 'should return the keys for strings' do
      expect(Hashmap.hash('Rama')).to eq 3
      expect(Hashmap.hash('Sita')).to eq 3
    end
  end
  context 'adding entries to hash' do
  end
end
