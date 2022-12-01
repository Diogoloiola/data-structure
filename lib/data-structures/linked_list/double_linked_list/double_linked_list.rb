require_relative 'node'

class DoubleLinkedList
  def initialize
    @list = nil
  end

  def append(value)
    new_node = Node.new(value, @list)

    @list.previous_element = new_node if @list

    @list = new_node
  end

  def insert_end(value)
    new_node = Node.new(value)
    return @list = new_node if @list.nil?

    aux = @list

    aux = aux.next_element while aux.next_element

    new_node.previous_element = aux
    aux.next_element = new_node
  end

  def insert_orderned(value)
    return @list = Node.new(value) if @list.nil?

    current = @list
    previous = nil

    while current && current.value < value
      previous = current
      current = current.next_element
    end

    if current == @list
      append(value)
    else
      new_node = Node.new(value)

      new_node.next_element = previous.next_element
      new_node.previous_element = previous
      previous.next_element = new_node

      current.previous_element = new_node unless current.nil?
    end
  end

  def remove_first
    raise 'List vazia' if @list.nil?

    @list = @list.next_element

    @list.previous_element = nil unless @list.nil?
  end

  def remove_end
    raise 'List vazia' if @list.nil?

    current = @list
    previous = nil

    while current.next_element
      previous = current
      current = current.next_element
    end

    if current == @list
      remove_first
    else
      previous.next_element = current.next_element
    end
  end

  def remove(value)
    raise 'Lista vazia' if @list.nil?

    current = @list
    previous = nil

    while current && current.value != value
      previous = current
      current = current.next_element
    end

    return false if current.nil?

    if current == @list
      remove_first
    else
      previous.next_element = current.next_element
    end

    current.next_element.previous_element = current.previous_element unless current.next_element.nil?
  end 

  def print_normal
    raise 'Lista vazia' if @list.nil?

    aux = @list
    puts '==========================='
    while aux
      puts aux.value
      aux = aux.next_element
    end
    puts '==========================='
  end

  def print_reverse
    raise 'Lista vazia' if @list.nil?

    aux = @list

    aux = aux.next_element while aux.next_element

    puts '==========================='
    while aux
      puts aux.value
      aux = aux.previous_element
    end
    puts '==========================='
  end
end
