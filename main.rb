require 'io/console'
require_relative 'books/book'
require_relative 'books/label'
require_relative 'item'
require_relative 'books/modules/label_module'
require_relative 'books/modules/book_module'


class Main

  include BookModule
  include LabelModule

  def initialize
    @books = []
    @labels = []
  end

  def user_input(message)
    print message
    gets.chomp
  end

  def start
    puts '-' * 50
    puts ':star:  Welcome to your catalog of things! :star:'
    loop do
      puts '-' * 50
      puts '
          1- List all books
          2- List all music albums
          3- List of games
          4- List all genres
          5- List all labels
          6- List all authors
          7- Add a book
          8- Add a music album
          9- Add a game
          10- Quit'
      input = user_input('Choose an option: ').to_i
      break if input == 10

      options(input)
    end
    puts 'Thank you for using our app !'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options(input)
    case input
    when 1
      list_books
    when 5
      list_labels
    when 7
      add_book
    else

      puts 'Please choose a valid number!'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity