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
    @buckets[check_bounds(hash(key))].append([value, key])
  end

  def get(key)
    @buckets[hash(key)][0]
  end

  def has?(key)
    @buckets.each { return true if bucket.contains?(key) }
    false
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

  # FIXME: Hash doesn't return a correct value
  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @capacity
  end

  private

  def check_bounds(index)
    raise IndexError if index.negative? || index >= @buckets.length

    index
  end
end
