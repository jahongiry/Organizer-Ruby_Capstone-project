require 'io/console'

require_relative 'music_album/music_album'
require_relative 'music_album/music_album_controller'
require_relative 'genre/genre'
require_relative 'genre/genre_controller'

# require_relative 'game_author/list_games_authors'
# require_relative 'game_author/add_game'
# require_relative 'game_author/author'
# require_relative 'game_author/load_data'
# require_relative 'game_author/save_data'

require_relative 'books/book'
require_relative 'books/label'
require_relative 'item'
require_relative 'books/persist_files/persist_books'
require_relative 'books/persist_files/persist_labels'
require_relative 'books/modules/label_module'
require_relative 'books/modules/book_module'


class Main
  include MusicAlbumsController
  include GenresController
  include BooksPersistence
  include LabelsPersistence
  include BookModule
  include LabelModule

  # include ListGameAndAuthor
  # include AddGame
  # include LoadData
  # include SaveData

  def initialize
    @genres = load_genres
    @books = load_books
    @labels = load_labels
    # @game = load_games
    # @author = load_authors
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
    store_genres(@genres)
    store_books(@books)
    store_labels(@labels)
    store_movies(@movies)
    store_sources(@sources)
    puts 'Thank you for using our app !'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def options(input)
    case input
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    else

      puts 'Please choose a valid number!'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity