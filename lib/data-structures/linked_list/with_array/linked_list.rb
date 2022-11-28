class LinkedListWithArray
  attr_accessor :data

  def initialize
    @data = []
  end

  def insert(node)
    create_space if @data.length >= 1
    @data[0] = node
  end

  def prepend(node)
    @data << node
  end

  def insert_order(node)
    index = 0
    size = length
    index += 1 while index < size && @data[index].value < node.value

    k = length - 1
    while k >= index
      @data[k + 1] = @data[k]
      k -= 1
    end
    @data[index] = node
  end

  def search(key)
    index = 0
    size = length
    index += 1 while index < size && @data[index].value < key

    return false if size == index

    @data[index].value == key
  end

  def print
    @data.each { |node| puts node.value }
  end

  def length
    @data.size
  end

  private

  def create_space
    (0..length - 1).reverse_each do |index|
      @data[index + 1] = @data[index]
    end
  end
end
