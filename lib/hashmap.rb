# frozen_string_literal: true

require './lib/linkedlist'

# A custom hashmap
class Hashmap
  @constant = (Math.sqrt(5) - 1) / 2
  def initialize(load = 0, capacity = 16)
    @load = load
    @capacity = capacity
    @buckets = Array.new(16, LinkedList.new)
  end

  def set(key, value)
    @buckets[hash(key)] = [value, key]
  end

  def get(key)
  end

  def has?(key)
  end

  def remove(key)
  end

  def length
  end

  def clear
  end

  def keys
  end

  def values
  end

  def entries
  end

  def self.hash(key)
    raise 'Key cannot be nil' if key.nil?

    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code

    # (((key * @constant) % 1) * 2**32).floor
  end

  private

  def check_bounds(index)
    raise IndexError if index.negative? || index >= @buckets.length
  end
end
