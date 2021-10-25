require_relative '../Classes/movie'
module Appfunctions
  def valid_year?(num)
    return unless num.length != 4

    puts 'Please enter a valid year'
    year = gets.chomp
    valid_year?(year)
  end

  def create_movie(list)
    puts "\nWhat is the publish date of the movie? e.g. 1967"
    year = gets.chomp
    valid_year?(year)
    puts "\nIt's the movie silent?"
    puts '1 - Yes'
    puts '2 - No'
    silent = gets.chomp.to_i
    movie = Movie.new(year, silent: silent)
    list << movie
  end

  def show_movies(list)
    list.each { |movie| puts "\nPublished in: #{movie.publish_date}, Silent: #{movie.silent}" }
  end

  def show_sources(list)
    puts "\nSources:"
    list.each { |source| puts "\n#{source}"}
  end
end
