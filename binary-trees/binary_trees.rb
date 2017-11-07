class Tree
  class Node
    attr_accessor :parent_node, :child_left, :child_right

    def initialize(value)
      @value = value
      @child_left = nil
      @child_right = nil
    end

    def insert(new_key)
      if new_key <= @value
        @child_left.nil?  ? @child_left = Node.new(new_key) : @child_left.insert(new_key)
      elsif new_key > @value
        @child_right.nil? ? @child_right = Node.new(new_key) : @child_right.insert(new_key)
      end
    end

    def value
      @value
    end
  end #end of node class


  def initialize
    @root = nil
  end

  def build_tree(array)
    array.each do |item|
      insert(item)
    end
  end

  def root
    @root
  end

  def insert(parent_node)
    if @root.nil?
      @root = Node.new(parent_node)
    else
      @root.insert(parent_node)
    end
  end

  def breadth_first_search(number)
    queue = Queue.new
    queue << @root
    until queue.empty?
      node = queue.shift #FIFO
      if node.value == number
        return node.value
      else
        queue << node.child_left  if node.child_left != nil
        queue << node.child_right if node.child_right != nil
      end
    end
  end

  def depth_first_search(number)
    stack = []
    stack << @root
    until stack.empty?
      node = stack.pop #LIFO
      if node.value == number
        return node.value
      else
        stack << node.child_left  if node.child_left != nil
        stack << node.child_right if node.child_right != nil
      end
    end
  end

  def dfs_rec(number, node=@root)
    return nil if node.nil?
    return node.value if node.value == number
    dfs_rec(number,node.child_left)  unless node.child_left.nil?
    dfs_rec(number,node.child_right) unless node.child_right.nil?
  end

end

tree = Tree.new
tree.build_tree([1,7,4,23,8,9,4,3,5,7,9,67,6345,324])
puts tree.inspect
puts " "
puts "bfs test"
puts "#{tree.breadth_first_search(23)}"
puts "#{tree.breadth_first_search(48)}"
puts " "
puts "dfs test"
puts "#{tree.depth_first_search(6345)}"
puts "#{tree.depth_first_search(48)}"
puts " "
puts "dfs_rec test"
puts "#{tree.dfs_rec(67)}"
puts "#{tree.dfs_rec(48)}"
