require_relative '../Classes/movie'
require_relative '../Classes/game'

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
    data = { publish_date: movie.publish_date, silent: silent == 1 }
    @db.save(data, 'movies')
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

  def show_authors(list)
    puts "\nAuthors:"
    list.each { |author| puts "#{author.first_name} #{author.last_name}" }
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
    data = { multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date }
    @db.save(data, 'games')
  end
end
