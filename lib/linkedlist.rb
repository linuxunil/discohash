# frozen_string_literal: false

require './lib/node'

# Simple linked list of nodes
class LinkedList
  attr_accessor :root_node

  def initialize(node_value = nil)
    @root_node = Node.new(node_value)
  end

  def size
    return 0 if root_node.value.nil?

    traverse_last_node(return_index: true)
  end

  def head
    raise 'Empty List' if @root_node.value.nil?

    @root_node.value
  end

  def [](index)
    at(index).value
  end

  def at(index)
    return @root_node if index.zero?

    current_node = @root_node
    [0...index].each do |_i|
      current_node = current_node.next_node
    end
    current_node
  end

  def append(new_node_value)
    end_node = traverse_last_node
    end_node.next_node = Node.new(new_node_value)
  end

  def prepend(new_node_value)
    new_node = Node.new(new_node_value)
    new_node.next_node = @root_node
    @root_node = new_node
  end

  def pop
    end_node = traverse_last_node
    prev_node = at(traverse_last_node(return_index: true) - 1)
    prev_node.next_node = nil
    end_node
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
    current_node = @root_node
    loop do
      builder_string << "( #{current_node.value} )"
      builder_string << ' -> '
      return builder_string << 'nil' if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end

  def traverse_last_node(return_index: false)
    index = 0
    current_node = @root_node
    return @root_node if !return_index && @root_node.value.nil?
    return index if @root_node.value.nil?

    loop do
      return current_node if !return_index && current_node.next_node.nil?
      return index if current_node.next_node.nil?

      index += 1
      current_node = current_node.next_node
    end
  end

  def tail
    traverse_last_node.value
  end

  def search(value)
    current_node = @root_node
    node_index = 0
    loop do
      return [true, node_index] if current_node.value == value
      return [false, node_index] if current_node.next_node.nil?

      node_index += 1
      current_node = current_node.next_node
    end
  end

  def empty?
    @root_node.value.nil?
  end
end
