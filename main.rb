require 'io/console'


require_relative 'Books/book'
require_relative 'Books/label'
require_relative 'item'
require_relative 'Books/modules/label_module'
require_relative 'Books/modules/book_module'
require_relative 'Books/persist_files/persist_books'
require_relative 'Books/persist_files/persist_labels'
require_relative 'modules/author_module'
require_relative 'modules/game_module'
require_relative 'modules/preserve_data'
require_relative 'controllers/music'
require_relative 'controllers/genre_controller'


class Main

  include BookModule
  include LabelModule
  include BooksPersistence
  include LabelsPersistence

  include PreserveData
  include GameModule

  include MusicAlbumController
  include GenresController

  def initialize
    @books = load_books
    @labels = load_labels
    @games = []
    @authors = []
    load_all_data
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
          10- Add an author
          11- Quit'
      input = user_input('Choose an option: ').to_i
      break if input == 11

      options(input)
    end
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
    when 9
      add_game
    when 10
      add_author
    when 8
      add_music_album
    else

      puts 'Please choose a valid number!'
    end
  end

  def save_json_data
    games = []
    authors = []
    # Save games

    @games.each do |game|
      games.push({
                   publish_date: game.publish_date,
                   multiplayer: game.multiplayer,
                   last_played_at: game.last_played_at
                 })
    end
    save_data(games, 'games')

    # Save authors

    @authors.each do |author|
      authors.push({
                     first_name: author.first_name,
                     last_name: author.last_name
                   })
    end
    save_data(authors, 'authors')
  end

  def load_all_data
    # Load games
    games = load_data("games")
    games.each do |game|
      @games.push(Game.new(game['publish_date'], game['multiplayer'], game['last_played_at']))
    end

    # Load authors
    authors = load_data('authors')
    authors.each do |author|
      @authors.push(Author.new(author['first_name'], author['last_name']))
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity