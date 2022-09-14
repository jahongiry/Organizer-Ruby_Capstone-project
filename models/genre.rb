class Genre
    attr_accessor :item, :name, :id

    def initialize(name, id= abc)
        @name = name
        @id = id || random.Rand(1..100)
        @item = []
    end

    def add_item(item)
        @item << item
        item.genre = self
    end
end