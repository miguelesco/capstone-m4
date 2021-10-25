require_relative 'item'
require_relative 'db'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state = '', publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    # @db = DB.new
    # @db.save(publisher: @publisher, cover_state: @cover_state, publish_date: @publish_date, class: self.class.to_s)
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
