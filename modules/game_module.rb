require_relative '../models/game'
require_relative '../item'

module GameModule
  def list_games
    if @games.empty?
      puts 'No game in the catalog'
      return
    end
    puts "\n"

    @games.each do |game|
      puts "publish date: #{game.publish_date},
       multiplayer: #{game.multiplayer}, last_played_at: #{game.last_played_at}"
    end
  end

  def add_game
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp

    print 'Is multiplayer game? [ yes, no ]: '
    multiplayer = gets.chomp

    case multiplayer
    when 'yes'
      multiplayer_value = 'yes'
    when 'no'
      multiplayer_value = 'no'
    else
      puts 'yes or no'
      multiplayer_value = gets.chomp
    end

    print 'Last played at[YYYY-MM-DD]: '
    last_played_at = gets.chomp

    game = Game.new(publish_date, multiplayer_value, last_played_at)
    @games.push(game)
    puts 'New Game added successfully'
  end
end
