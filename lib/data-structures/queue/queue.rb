# Enqueue: Add an element to the end of the queue
# Dequeue: Remove an element from the front of the queue
# IsEmpty: Check if the queue is empty
# IsFull: Check if the queue is full
# Peek: Get the value of the front of the queue without removing it
require_relative 'node'

class Queue
  def initialize
    @queue = nil
  end

  def enqueue(value)
    return @queue = Node.new(value) if @queue.nil?

    aux = @queue

    aux = aux.next_element while aux.next_element

    aux.next_element = Node.new(value)
  end

  def dequeue
    raise 'Fila vazia' if @queue.nil?

    node = @queue

    @queue = node.next_element
  end

  def empty?
    @queue.nil?
  end

  def peek
    return if empty?

    @queue.value
  end

  def print_queue
    puts '========================='
    aux = @queue

    while aux
      print "#{aux.value} "
      aux = aux.next_element
    end
    puts "\n========================="
  end
end
