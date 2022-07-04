class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    return prepend(value) if @head.nil?

    temp = @head
    temp = temp.next_node until temp.next_node.nil?

    temp.next_node = Node.new(value)
    @tail = temp.next_node
  end

  def prepend(value)
    return @head = Node.new(value) if @head.nil?

    @head = Node.new(value, @head.next_node)
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
