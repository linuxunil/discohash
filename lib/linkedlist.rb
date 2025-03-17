# frozen_string_literal: true

require './lib/node'

# Simple linked list of nodes
class LinkedList
  attr_accessor :root_node, :size

  def initialize(node_value = nil)
    @root_node = Node.new(node_value)
    @size = 0
  end

  def at(index)
    current_node = root_node
    index.times { current_node = current_node.next_node }
    current_node
  end

  def append(new_node_value)
    if root_node.value.nil?
      root_node.value = new_node_value
    else
      last_node = tail
      last_node.next_node = Node.new(new_node_value)
    end
    @size += 1
  end

  def prepend(new_node_value)
    new_root_node = Node.new(new_node_value)
    new_root_node.next_node = root_node
    @root_node = new_root_node
    @size += 1
  end

  def head
    root_node
  end

  def pop
    current_node = root_node
    previous_node = root_node
    until current_node.next_node.nil?
      _previous_node_ = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil unless previous_node == root_node
    @size -= 1 unless size.zero?
    current_node
  end

  def contains?(value)
    contain, _index = search(value)
    contain
  end

  def find(value)
    _contain, index = search(value)
    index
  end

  def to_s
    builder_string = ''
    current_node = root_node
    loop do
      builder_string << "( #{current_node.value} )"
      builder_string << ' -> '
      return builder_string << 'nil' if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end

  def tail
    current_node = root_node
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def search(value)
    current_node = root_node
    node_index = 0
    loop do
      return [true, node_index] if current_node.value == value
      return [false, node_index] if current_node.next_node.nil?

      node_index += 1
      current_node = current_node.next_node
    end
  end

  def empty?
    root_node.value.nil?
  end
end
