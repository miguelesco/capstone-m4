require_relative '../Classes/movie'
require_relative '../Classes/game'
require_relative '../Classes/music'
require_relative '../Classes/book'
require_relative '../Classes/source'
require_relative '../Classes/label'

module ShowItems
  def show_movies
    list = @db.get_all_data_of('movies')
    list.each { |movie| puts "\nPublished in: #{movie['publish_date']}, Silent: #{movie['silent']}, Source: #{movie['source']}" }
  end

  def show_sources
    puts "\nSources:"
    list = @db.get_all_data_of('sources')
    list.each_with_index { |source, i| puts "#{i} - #{source['name']}" }
  end

  def show_labels(list)
    puts "\nLabels:"
    list.each_with_index { |label, i| puts "#{i} - #{label['title']}" }
  end

  def show_games
    puts "\nGames:"
    list = @db.get_all_data_of('games')
    list.each do |game|
      puts "Published in: #{game['publish_date']}," \
           " Multiplayer: #{game['multiplayer']}," \
           " Last played at: #{game['last_played_at']}" \
           " Author: #{game['author']}"
    end
  end

  def show_authors
    puts "\nAuthors:"
    list = @db.get_all_data_of('authors')
    list.each_with_index { |author, index| puts "#{index} - #{author['first_name']} #{author['last_name']}" }
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
      labels.each { |label| puts "\n Title: #{label['title']} Color: #{label['color']}" }
    end
  end
  
end

module CreateItems
  include ShowItems

  def valid_year?(num)
    return unless num.length != 4

    puts 'Please enter a valid year'
    year = gets.chomp
    valid_year?(year)
  end

  def create_movie
    source = create_source
    source
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

  def create_author
    puts "\nSelect a author from the following list or 'a' to add a new author:"
    author_list = @db.get_all_data_of('authors')
    show_authors
    input = gets.chomp
    if input != 'a'
      Author.new(author_list[input.to_i]['first_name'], author_list[input.to_i]['last_name'])
    else
      puts "\nWhat is the first name of author?"
      first_name = gets.chomp
      puts "\nWhat is the last name of author?"
      last_name = gets.chomp
      data = {first_name: first_name, last_name: last_name}
      @db.save(data, 'authors')
      Author.new(first_name, last_name)
    end
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

  def create_source
    puts "\nSelect a source from the following list or 'a' to add a new source:"
    sources_list = @db.get_all_data_of('sources')
    show_sources
    input = gets.chomp
    if input != 'a'
      Source.new(sources_list[input.to_i]['name'])
    else
      puts "\nWhat is your source?"
      new_source = gets.chomp
      data = {name: new_source}
      @db.save(data, 'sources')
      Source.new(new_source)
    end
  end

  def create_label
    puts "\nSelect a label from the following list or type 'a' to add a new source:"
    list_of_labels = @db.get_all_data_of('labels')
    show_labels(list_of_labels)
    option_selected = gets.chomp
    if option_selected == 'a'
      puts "\nWhat is the title of the label?"
      title = gets.chomp
      puts "\n What is the color of the label"
      color = gets.chomp
      data = { title: title, color: color, items: [] }
      @db.save(data, 'labels')
      return label = Label.new(title, color)
    else 
      return label = Label.new(list_of_labels[input.to_i]['title'], list_of_labels[input.to_i]['color'])
    end
  end
end
