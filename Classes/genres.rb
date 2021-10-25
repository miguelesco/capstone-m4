require_relative 'item.rb'

class Genre
    attr_accessor :items 

    def initialize(name)
        @id = Random.rand(1..10_000)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item unless @items.include?(item)
        item.add_genre(self)
    end
end

wololo = Genre.new('gaga')
p wololo
