require_relative '../Classes/game.rb'

describe Game do
    MULTI = 'multiplayer'
    DATE = 3
    PUBLISH_DATE = 10
    let(:game) {Game.new(MULTI, DATE, PUBLISH_DATE)}

    it 'takes two parameters and return the Game object' do
        expect(game).to be_an_instance_of(Game)
    end

    it 'takes two parameters and return the right multiplayer' do
        expect(game.multiplayer).to eq(MULTI)
    end

    it 'takes two parameters and return the right date' do
        expect(game.last_played_at).to eq(DATE)
    end

    it 'Test for can_be_archived? method' do
        expect(game.can_be_archived?).to eq(false)
    end
end
