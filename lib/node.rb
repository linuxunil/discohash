# frozen_string_literal: true

# Basic node
class Node
  attr_accessor :value, :next_node, :key

  def initialize(value = nil)
    @value = value
    @key = key
    @next_node = nil
  end
end
