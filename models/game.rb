require_relative '../models/item'

class  Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date 

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date,strptime(last_played_at, '%Y-%m-%d')
  end

  def can_be_achieved?
    super && (Date.today.year - @last_played_at.year) > 2
  end
end
