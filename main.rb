class Main
  def menu_display
    menu_arr = ["\n1-  List all books", '2-  List all music albums', '3-  List all movies', '4-  List all games',
                '5-  List all genres', '6-  List all labels', '7-  List all authors', '8-  List all sources',
                '9-  Add a book', '10- Add a music album', '11- Add a movie', '12- Add a game', '13- Exit']
    menu_arr.each { |e| puts e }
    option = gets.chomp.to_i
    choose_option(option)
  end

  def choose_option(option)
    case option
    when 1
      '1'
    when 2
      '2'
    when 3
      '3'
    when 4
      '4'
    when 5
      '5'
    when 6
      '6'
    when 7
      '7'
    when 8
      '8'
    when 9
      '9'
    when 10
      '10'
    when 11
      '11'
    when 12
      '13'
    when 13
      puts "\n--Thank you for using the App!--"
      nil
    end
  end
end

start = Main.new
start.menu_display
