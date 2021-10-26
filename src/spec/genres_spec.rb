require_relative '../Classes/genres'
require_relative '../Classes/item'

describe Genre do
  name = 'Machine gun Eddie'
  date = 11
  let(:genres) { Genre.new(name) }
  let(:item) { Item.new(date) }

  it 'Should return an instance of Genre' do
    expect(genres).to be_instance_of(Genre)
  end

  it 'Should return the right name' do
    expect(genres.name).to eq(name)
  end

  it 'Should return the right state of spotify' do
    genres.add_item(item)
    expect(genres.items[0]).to be(item)
  end
end
