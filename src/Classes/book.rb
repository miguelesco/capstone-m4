require_relative 'item'
require_relative 'db'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @db = DB.new
    @data = { publisher: @publisher, cover_state: @cover_state, publish_date: @publish_date }
    @db.save(@data, 'books')
    @db.get_all_data_of('books')
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
