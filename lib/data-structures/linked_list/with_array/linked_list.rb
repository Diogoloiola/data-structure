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
