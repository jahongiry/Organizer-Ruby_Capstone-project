require_relative 'item'

class Author < Item
  attr_accessor :name, :items
  attr_reader :genre, :label, :archived, :source
  
  def initialize(name)
    @name = name
    @items = []
  end
  
  def add_item(item)
    @items.push(item) unless @items.include?(item)
  end
  
  def add_genre(genre)
    @genre = genre.name
    genre.item << self unless genre.items.include?(self)
  end
  
  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
  
  def move_to_archive
    true if can_be_archived?
  end
  
  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end
end
