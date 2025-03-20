# frozen_string_literal: true

require './lib/hashmap'

describe Hashmap do
  context 'hashing entries' do
    xit 'should return the keys for strings' do
      expect(Hashmap.hash('Rama')).to eq [3, 'Rama']
      expect(Hashmap.hash('Sita')).to eq [3, 'Sita']
    end
  end
  context 'adding entries to hash' do
    it 'should return the value for the hash' do
      hash_map = Hashmap.new
      hash_map.set('Rima', 6)
      expect(hash_map.get('Rima')).to eq 6
    end
  end

  context 'has entry' do
    hash_map = Hashmap.new
    it 'should return true if key exists exits' do
      hash_map.set('Rima', 6)
      expect(hash_map.has?('Rima')).to eq true
    end
    it 'should return false if no key' do
      expect(hash_map.has?('Sita')).to eq false
      expect(hash_map.has?('None')).to eq false
    end
  end

  context 'remove entry' do
    hash_map = Hashmap.new
    hash_map.set('Rima', 6)
    it 'should remove an entry if it exits' do
      expect(hash_map.remove('Rima')).to eq true
      expect(hash_map.remove('set')).to eq false
    end
  end

  context 'get length' do
    it 'should return the length' do
      hash_map = Hashmap.new
      hash_map.set('Rima', 6)
      expect(hash_map.length).to eq 1
    end
  end

  context 'removes all entries in the hash' do
    it 'should be empty after call' do
      hash_map = Hashmap.new
      hash_map.set('Rima', 6)
      expect(hash_map.length).to eq 1
      hash_map.clear
      expect(hash_map.length).to eq 0
    end
  end

  context 'return all keys' do
    it 'should list all the keys' do
      hash_map = Hashmap.new
      hash_map.set('Rima', 6)
      hash_map.set('Sita', 4)
      expect(hash_map.length).to eq 2
      expect(hash_map.keys).to eq %w[Rima Sita]
    end
  end

  context 'return all values' do
  end

  context 'return an array of key value pairs' do
  end
end
