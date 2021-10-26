require_relative '../Classes/movie'
require_relative '../Classes/music'

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
    Movie.new(year, silent: silent == 1)
    data = { publish_date: year, silent: silent == 1 }
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

  def create_music_album
    p "\nWhat is the publish date of the album? e.g. 1967"
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
end
