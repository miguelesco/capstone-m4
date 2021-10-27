require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, "%Y/%m/%d")
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year).abs > 2
  end
end
