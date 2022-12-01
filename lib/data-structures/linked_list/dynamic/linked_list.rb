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

  def remove_begin
    raise 'List vazia' if @list.nil?

    node = @list
    @list = @list.next_element

    node.next_element = nil
    node.value = nil
  end

  def remove_end # rubocop:disable Metrics/MethodLength
    raise 'List vazia' if @list.nil?

    current = @list
    before = nil

    while current.next_element
      before = current
      current = current.next_element
    end

    if current == @list
      @list = nil
    else
      before.next_element = current.next_element
    end
  end

  def remove(value) # rubocop:disable Metrics/MethodLength
    raise 'List vazia' if @list.nil?

    current = @list
    before = nil

    while current && current.value != value
      before = current
      current = current.next_element
    end

    return false if current.nil?

    if current == @list
      remove_begin
    else
      before.next_element = current.next_element
    end

    true
  end

  def print
    aux = @list
    puts '================================='
    while aux
      puts aux.value
      aux = aux.next_element
    end
    puts '================================='
  end
end
