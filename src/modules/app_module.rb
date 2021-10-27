require_relative '../Classes/movie'
require_relative '../Classes/game'
require_relative '../Classes/music'
require_relative '../Classes/book'
require_relative '../Classes/author.rb'

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

  def show_games
    puts "\nGames:"
    list = @db.get_all_data_of('games')
    list.each do |game|
      puts "Published in: #{game['publish_date']}," \
           " Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}"
    end
  end

  def show_authors
    puts "\nAuthors:"
    list = @db.get_all_data_of('authors')
    list.each { |author| puts "#{author.first_name} #{author.last_name}" }
  end

  def create_game
    puts "\nWhen was it published (yyyy-mm-dd)?"
    year = gets.chomp
    puts "\nIs the game multiplayer?"
    puts '1 - Yes'
    puts '2 - No'
    multiplayer = gets.chomp.to_i
    puts "\nWhen did you play it for last time (yyyy-mm-dd)?"
    last_played = gets.chomp
    game = Game.new(multiplayer == 1, last_played, year)
    data = { multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date }
    @db.save(data, 'games')
    puts "\nThe game was created successfully"
  end

  def create_author
    puts "\nWhat is the first name of author?"
    first_name = gets.chomp
    puts "\nWhat is the last name of author?"
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    data = { author_id: author.id, first_name: author.first_name, last_name: author.last_name }
    @db.save(data, 'authors')
    puts "\nThe author was created successfully"
  end

  def create_music_album
    puts "\nWhat is the publish date of the album? e.g. 1967"
    date = gets.chomp
    valid_year?(date)
    puts "\nIs the album on Spotify?"
    puts '1 - Yes'
    puts '2 - No'
    spotify = gets.chomp.to_i
    MusicAlbum.new(date, spotify == 1)
    data = { publish_date: date, on_spotify: spotify == 1 }
    @db.save(data, 'music_albums')
  end

  def list_albums
    list = @db.get_all_data_of('music_albums')
    list.each { |album| puts "\nPublished in: #{album['publish_date']}, Album is on spotify: #{album['on_spotify']}" }
  end

  def list_genres(list)
    puts "\nGenres:"
    list.each { |genre| puts "\n#{genre}" }
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
