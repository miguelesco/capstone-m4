require_relative './Classes/movie'
require_relative './Classes/author'
require_relative './Classes/db'
require_relative './modules/app_module'

class App
  include Appfunctions

  def initialize
    @db = DB.new
    @options = [
      'List all books',
      'List all music albums',
      'List all movies',
      'List all games',
      'List all genres',
      'List all labels',
      'List all authors',
      'List all sources',
      'Add a book',
      'Add a music album',
      'Add a movie',
      'Add a game',
      'Exit'
    ]
    @run_app = false
    @sources = ['My friend', 'Online Store', 'TV', 'Livestream', 'Physical Store', 'Cinema']
    @genres = ['Death Metal', 'Rap', 'Samba', 'House']
  end

  def run
    @run_app = true
    select_option while @run_app
  end

  def exit!
    puts 'Thank you for using this app!'
    @run_app = false
  end

  private

  def select_option
    list_options
    selected_option = gets.chomp.to_i

    case selected_option
    when 1
      list_all_books
    when 2
      list_albums
    when 3
      show_movies
    when 4
      show_games
    when 5
      list_genres(@genres)
    when 6
      list_all_labels
    when 7
      show_authors
    when 8
      show_sources(@sources)
    when 9
      add_book
    when 10
      create_music_album
    when 11
      create_movie
    when 12
      create_game
    when 13
      create_author
    when 14
      exit!
    end
  end

  def list_options
    puts "\n"
    puts 'Please choose an option by enterin a number'
    @options.each_with_index { |option, index| puts "#{index + 1} - #{option}" }
    puts "\n"
  end
end
