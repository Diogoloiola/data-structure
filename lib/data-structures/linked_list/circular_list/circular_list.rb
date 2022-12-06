require_relative 'node'

class CircularList
  def initialize
    @list = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @list.nil?
      new_node.next_element = new_node
    else
      aux = @list
      aux = aux.next_element while aux.next_element != @list

      aux.next_element = new_node

      new_node.next_element = @list

    end
    @list = new_node
  end

  def insert_end(value)
    new_node = Node.new(value)

    if @list.nil?
      new_node.next_element = new_node
      @list = new_node
    else
      aux = @list

      aux = aux.next_element while aux.next_element != @list

      aux.next_element = new_node

      new_node.next_element = @list
    end
  end

  def insert_orderned(value)
    if @list.nil?
      new_node = Node.new(value)
      new_node.next_element = new_node
      @list = new_node
    else
      current = @list
      previous = nil

      while current.next_element != @list && current.value < value
        previous = current
        current = current.next_element
      end

      if current == @list
        append(value)
      else
        new_node = Node.new(value)
        new_node.next_element = previous.next_element
        previous.next_element = new_node
      end
    end
  end

  def remove_begin
    raise 'Lista vazia' if @list.nil?

    return @list = nil if @list == @list.next_element

    aux = @list

    aux = aux.next_element while aux.next_element != @list

    node = @list

    aux.next_element = node.next_element

    @list = node.next_element
  end

  def remove_end
    raise 'Lista vazia' if @list.nil?

    return @list = nil if @list == @list.next_element

    current = @list
    previous = nil

    while current.next_element != @list
      previous = current
      current = current.next_element
    end

    if current == @list
      remove_begin
    else
      previous.next_element = current.next_element
    end
  end

  def remove_only_node(value)
    raise 'Lista vazia' if @list.nil?

    return remove_begin if @list == @list.next_element

    current = @list
    previous = nil

    while current.next_element != @list && current.value != value
      previous = current
      current = current.next_element
    end

    return if current == @list

    previous.next_element = current.next_element
  end

  def print_list
    raise 'List vazia' if @list.nil?

    aux = @list
    puts '=============================================='
    while aux.next_element != @list
      puts aux.value
      aux = aux.next_element
    end
    puts aux.value
    puts '=============================================='
  end
end
