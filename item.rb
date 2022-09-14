require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :genre, :label, :author, :archived, :source

  def initialize(date)
    @id = Random.rand(1..1000)
    @publish_date = Date.strptime(date, '%Y-%m-%d')
    @archived = false
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def add_genre(genre)
    @genre = genre.name
    genre.item << self unless genre.items.include?(self)
  end

  def move_to_archive
    true if can_be_archived?
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  private :can_be_archived?
end
