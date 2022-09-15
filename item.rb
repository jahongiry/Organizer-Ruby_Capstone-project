require 'date'
class Item
  attr_reader :id, :archived, :publish_date, :genre, :author, :source, :label

  def initialize(publish_date, archived, id = nil)
    @id = id || Random.rand(1..1000)
    @archived = archived
    @publish_date = publish_date
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self)
  end

  def genre=(genre)
    @genre = genre.name
    genre.items << self unless genre.items.include?(self)
  end

  private

  def can_be_archived?
    (Date.today.year - Date.parse(@publish_date).year).to_i > 10
  end
end