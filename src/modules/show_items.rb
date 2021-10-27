module ShowItems
  def show_movies
    list = @db.get_all_data_of('movies')
    if list.empty?
      puts "\nThere are no movies."
    else
      list.each do |movie|
        puts "\nPublished in: #{movie['publish_date']}, Silent: #{movie['silent']}, Source: #{movie['source']}"
      end
    end
  end

  def show_sources
    list = @db.get_all_data_of('sources')
    if list.empty?
      puts "\nThere are no sources."
    else
      puts "\nSources:"
      list.each_with_index { |source, i| puts "#{i} - #{source['name']}" }
    end
  end

  def show_labels(list)
    if list.empty?
      puts "\nThere are no labels."
    else
      puts "\nLabels:"
      list.each_with_index { |label, i| puts "#{i} - #{label['title']}" }
    end
  end

  def show_games
    list = @db.get_all_data_of('games')
    if list.empty?
      puts "\nThere are no games."
    else
      puts "\nGames:"
      list.each do |game|
        puts "Published in: #{game['publish_date']}," \
             " Multiplayer: #{game['multiplayer']}," \
             " Last played at: #{game['last_played_at']}" \
             " Author: #{game['author']}"
      end
    end
  end

  def show_authors
    list = @db.get_all_data_of('authors')
    if list.empty?
      puts "\nThere are no authors."
    else
      puts "\nAuthors:"
      list.each_with_index { |author, index| puts "#{index} - #{author['first_name']} #{author['last_name']}" }
    end
  end

  def list_albums
    list = @db.get_all_data_of('music_albums')
    if list.empty?
      puts "\nThere are no albums."
    else
      list.each do |album|
        puts "\nPublished in: #{album['publish_date']}, is on spotify: #{album['on_spotify']}, Genre: #{album['genre']}"
      end
    end
  end

  def list_genres
    list = @db.get_all_data_of('genres')
    if list.empty?
      puts "\nThere are no geners."
    else
      puts "\nGenres:\n\n"
      list.each_with_index { |genre, index| puts "#{index} - #{genre['name']}" }
    end
  end

  def list_all_books
    books = @db.get_all_data_of('books')
    if books.empty?
      puts "\nThere are no books."
    else
      books.each do |book|
        print "\nPublished: #{book['publish_date']} years ago, Publisher: #{book['publisher']} is in"
        print " #{book['cover_state']} state"
        puts ' '
      end
    end
  end

  def list_all_labels
    labels = @db.get_all_data_of('labels')
    if labels.empty?
      puts "\nThere are no labels."
    else
      labels.each { |label| puts "\n Title: #{label['title']} Color: #{label['color']}" }
    end
  end
end
