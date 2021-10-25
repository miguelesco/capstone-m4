require_relative '../Classes/movie'

describe Movie do
  context 'Creating a movie' do
    it 'Expects user to pass publish_date and silent as parameters' do
      movie = Movie.new(15, false)
      expect(movie).to be_an_instance_of Movie
    end

    it 'Throw an error if the right arguments are not passed' do
      expect {Movie.new(15)}.to raise_error(ArgumentError)
    end
  end

  context 'Using Movie can_be_archived? method' do
    before(:each) do
      @movie = Movie.new(15, false)
    end

    it 'Returns true if super returns true, so if publish_date > 10 years' do
      expect(@movie.can_be_archived?).to be true
    end
  end
end