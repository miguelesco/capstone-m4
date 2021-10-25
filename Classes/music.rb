require_relative 'item.rb'

class MusicAlbum < Item    
    def initialize(publish_date, on_spotify)
        super(publish_date)
        @on_spotify = on_spotify
    end

    def can_be_archived?        
        @on_spotify && super
    end
end
