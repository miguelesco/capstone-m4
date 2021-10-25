require_relative '../Classes/game.rb'

describe Game do
    let(:game) {Game.new('multiplayer', '2021/10/25')}

    it 'takes two parameters and return the Game object' do
        expect(game).to be_an_instance_of(Game)
    end
end
