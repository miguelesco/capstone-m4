require 'json'
class DB
  def initialize
    # Initialize database
    
    @books = []
  end

  def save(**data)
    # Save data to database
    @data = data
    case @data[:class]
    when 'Book'
      @books.push(@data)
    end

    @books
  end
end