module ShowItems
  def show_movies
    list = @db.get_all_data_of('movies')
    list.each do |movie|
      puts "\nPublished in: #{movie['publish_date']}, Silent: #{movie['silent']}, Source: #{movie['source']}"
    end
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
    list.each do |album|
      puts "\nPublished in: #{album['publish_date']}, is on spotify: #{album['on_spotify']}, Genre: #{album['genre']}"
    end
  end

  def list_genres
    list = @db.get_all_data_of('genres')
    puts "\nGenres:\n\n"
    list.each_with_index { |genre, index| puts "#{index} - #{genre['name']}" }
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
