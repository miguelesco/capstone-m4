require_relative '../Classes/movie'
require_relative '../Classes/author'
require_relative '../Classes/db'
require_relative 'show_items'
require_relative 'private_methods'

module CreateItems
  include ShowItems
  include PrivateMethods

  def valid_year?(num)
    return unless num.length != 4

    puts 'Please enter a valid year'
    year = gets.chomp
    valid_year?(year)
  end

  def create_movie
    source = create_source
    puts "\nWhat is the publish date of the movie? e.g. 1967"
    year = gets.chomp
    valid_year?(year)
    puts "\nIt's the movie silent?"
    puts '1 - Yes'
    puts '2 - No'
    silent = gets.chomp.to_i
    movie = Movie.new(year, silent: silent == 1)
    movie.add_source(source)
    data = {
      publish_date: movie.publish_date,
      silent: movie.silent == 1,
      source: movie.source.name
    }
    @db.save(data, 'movies')
  end

  def add_book
    label = create_label
    puts "\nWhen was it published (yyyy-mm-dd)?"
    publish_date = gets.chomp
    puts "\Who is the publisher of the book?"
    publisher = gets.chomp
    puts "\nWhich is the status of the cover? (ejem. bad or good)"
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    book.add_label(label)
    data = { publisher: book.publisher, cover_state: book.cover_state, publish_date: publish_date, label: label.title }
    @db.save(data, 'books')
    puts "\n book successfully created!"
  end

  def create_game
    puts "\nWhat is the publish date of the game? e.g. 1967"
    year = gets.chomp.to_i
    puts "\nDoes the game have a multiplayer mode?"
    puts '1 - Yes'
    puts '2 - No'
    multiplayer = gets.chomp.to_i
    puts "\nWhat is the last date you have played the game? e.g. 1967"
    last_played = gets.chomp.to_i
    author = create_author
    game = Game.new(multiplayer == 1, last_played, year)
    game.add_author(author)
    data = {
      multiplayer: game.multiplayer,
      last_played_at: game.last_played_at,
      publish_date: game.publish_date,
      author: "#{author.first_name} #{author.last_name}"
    }
    @db.save(data, 'games')
  end

  def create_music_album
    puts "\nSelect a Genre from the list bellow. If the Genre is not in the list type 'a' to add a new one."
    genre_return = create_genres
    puts "\nWhat is the publish date of the album? e.g. 1967"
    date = gets.chomp
    valid_year?(date)
    puts "\nIs the album on Spotify?"
    puts '1 - Yes'
    puts '2 - No'
    spotify = gets.chomp.to_i
    MusicAlbum.new(date, spotify == 1)
    data = { publish_date: date, on_spotify: spotify == 1, genre: genre_return.name }
    @db.save(data, 'music_albums')
  end
end
