require_relative './item.rb'

class Game < Item
    attr_accessor :multiplayer, :last_played_at
    def initialize(multiplayer, last_played_at, publish_date)
        super(publish_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        super && @last_played_at > 2
    end
end

game = Game.new('ewe', 3, 10)
p game
p game.can_be_archived?
