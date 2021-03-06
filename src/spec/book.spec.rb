require_relative '../Classes/book'

describe Book do
  publisher = 'Harry Potter'
  cover_state = 'bad'
  publish_date = 10
  let(:book) { Book.new(publisher, cover_state, publish_date) }

  it 'book is meant to be an instance of Book' do
    expect(book).to be_an_instance_of(Book)
  end

  it 'should return the publisher of the book object' do
    expect(book.publisher).to eq(publisher)
  end

  it 'should return the cover_state of the book object' do
    expect(book.cover_state).to eq(cover_state)
  end

  it 'Test for can_be_archived? method' do
    expect(book.can_be_archived?).to eq(true)
  end
end
