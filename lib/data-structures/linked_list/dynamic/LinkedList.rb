require_relative 'node'

class LinkedList
  def initialize
    @list = nil
  end

  def append(value)
    new_node = Node.new(value)

    return @list = new_node if @list.nil?

    @list = Node.new(value, @list)
  end

  def prepend(value)
    new_node = Node.new(value)

    return @list = new_node if @list.nil?

    aux = @list

    aux = aux.next_element while aux.next_element

    aux.next_element = new_node
  end

  def insert_orderned(value) # rubocop:disable Metrics/MethodLength
    new_node = Node.new(value)

    return @list = new_node if @list.nil?

    current = @list

    before = nil

    while current && current.value < new_node.value
      before = current
      current = current.next_element
    end

    if current == @list
      new_node.next_element = current
      @list = new_node
    else
      new_node.next_element = before.next_element
      before.next_element = new_node
    end
  end

  def print
    aux = @list
    while aux
      puts aux.value
      aux = aux.next_element
    end
  end
end
