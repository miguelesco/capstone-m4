require_relative '../Classes/author'
require_relative '../Classes/item'

describe Author do
  first_name = 'Alex'
  last_name = 'Guzman'
  let(:author) { Author.new(first_name, last_name) }
  let(:item) { Item.new(11, 100) }

  it 'takes two parameters and return the Author object' do
    expect(author).to be_an_instance_of(Author)
  end

  it 'takes two parameters and return the right first_name' do
    expect(author.first_name).to eq(first_name)
  end

  it 'takes two parameters and return the right last_name' do
    expect(author.last_name).to eq(last_name)
  end

  it 'Test for add_item method' do
    author.add_item(item)
    expect(author.items[0]).to eq(item)
  end
end
