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

    @head = Node.new(value, @head)
  end

  def size
    return 0 if @head.nil?

    size = 1
    temp = @head
    until temp.next_node.nil?
      temp = temp.next_node
      size += 1
    end
    size
  end

  def at(index)
    return @head if index == 0

    temp = @head
    1.upto(index) { temp = temp.next_node }

    temp
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

linked_lists = LinkedList.new
linked_lists.append(1)
linked_lists.append(2)
linked_lists.prepend(3)

p linked_lists.at(1)
