require_relative 'node'

class Stack
  def initialize
    @stack = nil
  end

  def push(value)
    new_node = Node.new(value)
    return @stack = new_node if @stack.nil?

    aux = @stack

    aux = aux.next_element while aux.next_element

    aux.next_element = new_node
  end

  def pop
    raise 'Pilha vazia' if @stack.nil?

    current = @stack
    previous = nil

    while current.next_element
      previous = current
      current = current.next_element
    end

    if current == @stack
      @stack = nil
    else
      previous.next_element = current.next_element
    end
  end

  def to_string
    aux = @stack
    puts '==================================='

    while aux
      print "#{aux.value} "

      aux = aux.next_element
    end
    puts "\n==================================="
  end
end
