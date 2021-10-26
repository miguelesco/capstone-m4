require_relative '../Classes/music'

describe MusicAlbum do    
    date = 10
    spotify = true
    let(:music_album) { MusicAlbum.new( date, spotify ) }
    
    it 'Should return an instance of MusicAlbum' do
        expect(music_album).to be_instance_of(MusicAlbum)
    end

    it 'Should return the right date' do        
        expect(music_album.publish_date).to eq(date)
    end

    it 'Should return the right state of spotify' do        
        expect(music_album.on_spotify).to eq(spotify)
    end

    it 'Should return can_be_archived as false' do
        expect(music_album.can_be_archived?).to eq(false)
    end    
end