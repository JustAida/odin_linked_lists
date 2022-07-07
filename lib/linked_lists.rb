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

  def pop
    return nil if @head.nil?

    temp = @head
    temp = temp.next_node until temp.next_node == @tail
    del = temp.next_node
    temp.next_node = nil
    @tail = temp
    del
  end

  def contains?(value)
    return true if @head.value == value

    temp = @head
    temp = temp.next_node until temp.value == value || temp.next_node.nil?
    temp.value == value
  end

  def find(value)
    return nil if @head.nil?

    temp = @head
    index = 0
    until temp.value == value
      temp = temp.next_node
      index += 1
      return nil if temp.nil?
    end

    index
  end

  def to_s
    temp = @head
    string = ""
    until temp.nil?
      string << "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    string << "nil"
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    return puts "Invalid index value." if index < 0 || index > (size - 1)

    prev = nil
    cur = @head
    idx = 0
    until idx == index
      prev = cur
      cur = cur.next_node
      idx += 1
    end

    prev.next_node = Node.new(value, cur)
  end

  def remove_at(index)
    return p nil if index < 0 || index > (size - 1)
    return pop if index == (size - 1)
    return @head = @head.next_node if index == 0

    prev = nil
    cur = @head
    idx = 0
    until idx == index
      prev = cur
      cur = cur.next_node
      idx += 1
    end

    prev.next_node = Node.new(cur.next_node.value, cur.next_node.next_node)
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
