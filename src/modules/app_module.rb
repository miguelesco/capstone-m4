require_relative '../Classes/movie'
require_relative '../Classes/game.rb'

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
    data = { publish_date: year, silent: silent == 1}
    @db.save(data, 'movies')
  end

  def show_movies
    list = @db.get_all_data_of('movies')
    list.each { |movie| puts "\nPublished in: #{movie['publish_date']}, Silent: #{movie['silent']}" }
  end

  def show_sources(list)
    puts "\nSources:"
    list.each { |source| puts "\n#{source}"}
  end

  def show_games
    list = @db.get_all_data_of('games')
    list.each { |game| puts "\nPublished in: #{game['publish_date']}, Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}" }
  end

  def show_authors(list)
    puts "\nAuthors:"
    list.each_with_index { |author, index| puts "#{index + 1} - #{author.first_name} #{author.last_name}" }
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
    game = Game.new(multiplayer == 1, last_played, year)
    data = { multiplayer: multiplayer == 1, last_played_at: last_played, publish_date: year}
    @db.save(data, 'games')
  end
end
