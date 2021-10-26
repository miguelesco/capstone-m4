require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = (Time.now.year - last_played_at).abs
  end

  def can_be_archived?
    super && @last_played_at > 2
  end
end
