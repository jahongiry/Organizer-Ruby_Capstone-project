# frozen_string_literal: true

require_relative 'item'
class MusicAlbum < item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify, id = nil, archived: false)
    super(publish_date, id, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived
    super && @on_spotify == ture
  end
end
