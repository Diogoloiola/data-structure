class LinkedListWithArray
  attr_accessor :data

  def initialize
    @data = []
    @size = 0
  end

  def insert(node)
    create_space if @data.length >= 1
    @data[0] = node
    @size += 1
  end

  def prepend(node)
    @data << node
    @size += 1
  end

  def insert_order(node)
    index = 0
    index += 1 while index < @size && @data[index].value < node.value

    k = @size - 1
    while k >= index
      @data[k + 1] = @data[k]
      k -= 1
    end
    @data[index] = node

    @size += 1
  end

  def search(key)
    index = 0
    index += 1 while index < @size && @data[index].value < key

    return false if @size == index

    @data[index].value == key
  end

  def remove_begin
    raise 'Lista vazia' if @size.zero?

    index = 0
    while index < @size
      @data[index] = @data[index + 1]
      index += 1
    end
    @size -= 1
  end

  def pop
    raise 'Lista vazia' if @size.zero?

    @size -= 1
  end

  def remove(value)
    index = 0
    index += 1 while index < @size && @data[index].value < value

    return false if @size == index

    while index < @size
      @data[index] = @data[index + 1]
      index += 1
    end
    @size -= 1
    true
  end

  def print
    puts '=================================================='
    (0..@size - 1).each { |index| puts @data[index].value }
    puts '=================================================='
  end

  private

  def create_space
    (0..length - 1).reverse_each do |index|
      @data[index + 1] = @data[index]
    end
  end
end
