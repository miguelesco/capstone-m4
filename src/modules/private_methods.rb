module PrivateMethods
  def create_author
    puts "\nSelect a author from the following list or 'a' to add a new author:"
    author_list = @db.get_all_data_of('authors')
    show_authors
    input = gets.chomp
    if input == 'a'
      puts "\nWhat is the first name of author?"
      first_name = gets.chomp
      puts "\nWhat is the last name of author?"
      last_name = gets.chomp
      data = { first_name: first_name, last_name: last_name }
      @db.save(data, 'authors')
      Author.new(first_name, last_name)
    else
      Author.new(author_list[input.to_i]['first_name'], author_list[input.to_i]['last_name'])
    end
  end

  def create_source
    puts "\nSelect a source from the following list or 'a' to add a new source:"
    sources_list = @db.get_all_data_of('sources')
    show_sources
    input = gets.chomp
    if input == 'a'
      puts "\nWhat is your source?"
      new_source = gets.chomp
      data = { name: new_source }
      @db.save(data, 'sources')
      Source.new(new_source)
    else
      Source.new(sources_list[input.to_i]['name'])
    end
  end

  def create_genres
    list_genres
    option = gets.chomp
    genres_list = @db.get_all_data_of('genres')
    if option == 'a'
      puts "\nInform the genre: "
      genre_input = gets.chomp
      data = { name: genre_input }
      @db.save(data, 'genres')
      Genre.new(genre_input)
    else
      Genre.new(genres_list[option.to_i]['name'])
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
      Label.new(title, color)
    else
      Label.new(list_of_labels[input.to_i]['title'], list_of_labels[input.to_i]['color'])
    end
  end
end
