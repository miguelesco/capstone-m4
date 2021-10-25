class Item
  attr_accessor :id, :publish_date, :archived, :author
  def initialize(publish_date, id = Random.rand(1..10_000), archived: false)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    @publish_date > 10
  end

  def move_to_archive?
    @archived = can_be_archived?
  end
end

item1 = Item.new(9)
item2 = Item.new(15)
p item1
p item2
p item1.can_be_archived?
p item1.move_to_archive?
