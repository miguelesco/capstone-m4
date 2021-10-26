require_relative '../Classes/movie'
require_relative '../Classes/book'

module Appfunctions
  def valid_year?(num)
    return unless num.length != 4

    puts 'Please enter a valid year'
    year = gets.chomp
    valid_year?(year)
  end

  def create_movie
    puts "\nWhat is the publish date of the movie? e.g. 1967"
    year = gets.chomp
    valid_year?(year)
    puts "\nIt's the movie silent?"
    puts '1 - Yes'
    puts '2 - No'
    silent = gets.chomp.to_i
    movie = Movie.new(year, silent: silent == 1)
    data = { publish_date: movie.publish_date, silent: movie.silent == 1 }
    @db.save(data, 'movies')
  end

  def add_book
    puts "\Who is the publisher of the book?"
    publisher = gets.chomp
    puts "\nWhich is the status of the cover?"
    cover_state = gets.chomp
    puts "\nHow many years have the book publish? (ejem. 5)"
    publish_date = gets.chomp.to_i
    book = Book.new(publisher, cover_state, publish_date)
    data = { publisher: book.publisher, cover_state: book.cover_state, publish_date: publish_date }
    @db.save(data, 'books')
  end

  def show_movies
    list = @db.get_all_data_of('movies')
    list.each { |movie| puts "\nPublished in: #{movie['publish_date']}, Silent: #{movie['silent']}" }
  end

  def show_sources(list)
    puts "\nSources:"
    list.each { |source| puts "\n#{source}" }
  end

  def list_all_books
    books = @db.get_all_data_of('books')
    books.each do |book|
      print "\nPublished: #{book['publish_date']} years ago, Publisher: #{book['publisher']} is in"
      print " #{book['cover_state']} state"
      puts ' '
    end
  end

  def list_all_labels
    labels = @db.get_all_data_of('labels')
    if labels.empty?
      puts "\nThere are no labels"
    else
      labels.each { |label| puts "\n#{label['name']}" }
    end
  end
end
