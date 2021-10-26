require_relative '../Classes/game'

describe Game do
  multi = 'multiplayer'
  date = 3
  publish_date = 10
  let(:game) { Game.new(multi, date, publish_date) }

  it 'takes two parameters and return the Game object' do
    expect(game).to be_an_instance_of(Game)
  end

  it 'takes two parameters and return the right multiplayer' do
    expect(game.multiplayer).to eq(multi)
  end

  it 'takes two parameters and return the right date' do
    expect(game.last_played_at).to eq(date)
  end

  it 'Test for can_be_archived? method' do
    expect(game.can_be_archived?).to eq(false)
  end
end
