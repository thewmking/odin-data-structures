class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @next_node = nil
    @value = value
  end

end


class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end


  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = @head
    else
      last_node = @head
      until last_node.next_node.nil?
        last_node = last_node.next_node
      end
      last_node.next_node = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = @head
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    node = @head
    count = 0
    until node.nil?
      count += 1
      node = node.next_node
    end
    count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    return nil if index < 0 || index >= self.size
    count = 0
    node = @head
    until index == (count+1)
      count += 1
      node = node.next_node
    end
    node.value
  end

  def pop
    if self.size == 0
      nil
    elsif self.size == 1
      node = @head
      @head = nil
      @tail = nil
      node
    else
      node = @head
      until node.next_node == @tail
        node = node.next_node
      end
      node.next_node = nil
      last_node = @tail
      @tail = node
      last_node
    end
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      node = node.next_node
    end
    false
  end

  def find(value)
    count = 0
    node = @head
    until node.nil?
      return count if node.value == value
      node = node.next_node
      count += 1
    end
    nil
  end

  def to_s
    current = @head
    until current.nil?
      print "( #{current.value} ) -> "
      current = current.next_node
    end
    print 'nil'
  end

  def insert_at(index, value)
    if index == 0
      prepend(value)
    elsif index > 0 || index > self.size
      new_node = Node.new(value)
      count = 0
      node = @head
      until index - 1 == count
        node = node.next_node
        count += 1
      end
      new_node.next_node = node.next_node
      node.next_node = new_node
    end
  end

  def remove_at(index)
    if self.size == 0 || index < 0 || index > self.size
      nil
    elsif self.size == 1
      @head = nil
      @tail = nil
    elsif index == 0
      remove_node = @head
      @head = remove_node.next_node
    else
      count = 0
      node = @head
      until index - 1 == count
        node = node.next_node
        count += 1
      end
      remove_node = node.next_node
      node.next_node = node.next_node.next_node
      @tail = node if node.next_node.nil?
    end
  end

end

list = LinkedList.new
puts " "
puts " "
puts "Append test:"
list.append("node 1")
puts "Tail: #{list.tail}. Size: #{list.size}"
list.append("node 2")
puts "Tail: #{list.tail}. Size: #{list.size}"
list.append("a third node")
puts "Tail: #{list.tail}. Size: #{list.size}"
puts "Full linked list:"
list.to_s

puts " "
puts " "
puts "Prepend test:"
list.prepend("This node should be third")
puts "Head: #{list.head}. Size: #{list.size}"
list.prepend("This node should be second")
puts "Head: #{list.head}. Size: #{list.size}"
list.prepend("This node should be first")
puts "Head: #{list.head}. Size: #{list.size}"
puts "Full linked list:"
list.to_s

puts " "
puts " "
puts "at(index) test:"
puts "#{list.at(3)} [should say 'this node should be third']"
puts "#{list.at(5)} [should say 'node 2']"

puts " "
puts " "
puts "pop test"
list.pop
puts "popped once"
list.to_s
puts " "
list.pop
puts "popped twice"
list.to_s

puts " "
puts " "
puts "contains? test"
puts "Contains 'node 1'? #{list.contains?('node 1')}"
puts "Contains 'node 2'? #{list.contains?('node 2')}"

puts " "
puts " "
puts "find(value) test"
puts "The index for 'node 1' is #{list.find('node 1')}"

puts " "
puts " "
puts "insert_at test:"
puts "should insert 'inserted node' before 'node 1'"
list.insert_at(3, "inserted node")
list.to_s
puts " "
puts " "
puts "should insert 'inserted earlier' before 'inserted node'"
list.insert_at(3, "inserted earlier")
list.to_s

puts " "
puts " "
puts "remove_at test:"
puts "should remove 'inserted earlier'"
list.remove_at(3)
list.to_s
