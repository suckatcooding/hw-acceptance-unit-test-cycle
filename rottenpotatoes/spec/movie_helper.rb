require 'movie_helper'

RSpec.describe Movie, :type => :model do

  describe "Checks if a number is odd" do
    it "should find movies with same director" do
      movie = Movie.find_title "Star Wars"
      Movie.same_director(movie).each do |mv|
        expect(mv.director).to eq(movie.director)
      end
    end

    # Sad path
    it "should not find anything if director is empty or nil" do
      movie = Movie.find_title "Alien"
      Movie.same_director(movie).each do |mv|
        expect(mv).to eq(movie)
      end
    end
  end
end