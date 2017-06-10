class LinkedList

  def initialize
    @head = Node.new
    @tail = @head
  end

  def append(value)
    node = Node.new(value)
    @tail.next_node = node
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @head.next_node
    @head.next_node = node
  end

  def size
    current_node = @head.next_node
    list_size = 0
    while current_node != nil
      list_size += 1
      current_node = current_node.next_node
    end
    return list_size
  end

  def head
    return @head.next_node
  end

  def tail
    return @tail
  end

  def at(index)
    current_node = @head.next_node
    index.times do |i|
      current_node = current_node.next_node
    end
    return current_node
  end
  
  def pop
    last_node = @tail
    current_node = @head.next_node
    while current_node.next_node!= @tail
      current_node = current_node.next_node
    end
    @tail = current_node
    current_node.next_node = nil
    return last_node
  end

  def contains?(value)
    current_node = @head.next_node
    while current_node.next_node != nil
      if current_node.value == value
        return true
      end
      current_node = current_node.next_node
    end
    return false
  end
  
  def find(data)
    index = 0
    current_node = @head.next_node
    while current_node.next_node != nil
      if current_node.value == data
        return index
      end
      index += 1
      current_node = current_node.next_node

    end

  end

  def to_s
    string = ""
    current_node = @head.next_node
    while current_node != nil
      string += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string += "nil"
    return string
  end

  def insert_at(index, data)
    current_node = @head
    current_index = 0
    while current_index != index
      current_node = current_node.next_node
      current_index += 1
    end
    node  = Node.new(data, current_node.next_node)
    current_node.next_node = node
  end

  def delete_at(index)
    current_node = @head
    current_index = 0
    while current_index != index
      current_node = current_node.next_node
      current_index += 1
    end
    deleted_node = current_node.next_node
    current_node.next_node  = deleted_node.next_node
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end

list = LinkedList.new
10.times do |x|
  list.append(x)
end
list.prepend("hello")

p list
puts list.size
puts list.head
puts list.at(0).value

puts list.pop.value
puts list.size

p list.contains?(5)
p list.contains?(13)
p list.find(6)
puts list.to_s

list.insert_at(5, "MOO")
puts list.to_s

list.delete_at(1)
puts list.to_s
