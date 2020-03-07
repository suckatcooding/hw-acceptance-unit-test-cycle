require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do
  before do
    Movie.create!(:title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25')
    Movie.create!(:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25')
    Movie.create!(:title => 'Alien', :rating => 'R', :release_date => '1979-05-25')
    Movie.create!(:title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11')
  end

  describe "find movies with the same director" do
    it "should find movies with same director" do
      get :same_director_movies, id: 1
      director = Movie.find(1).director
      movie1 = Movie.create(title: 'Test1', director: 'Director 1')
      movie2 = Movie.create(title: 'Test2', director: 'Director 1')
      assigns(:movies).each do |mv|
        expect(mv.director).to eq(director)
      end
    end
    
    
    it "should go to homepage if no director" do
      get :same_director_movies, id: 3
      expect(assigns(:movies)).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end