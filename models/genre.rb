class Genre
  attr_accessor :item, :name, :id

  def initialize(name, id = nil)
    @name = name
    @id = id || Random.rand(1..100)
    @item = []
  end

  def add_item(item)
    @item << item
    item.genre = self
  end
end
