class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.same_director(movie)
    return Movie.where(director: movie.director)
  end

  def self.find_title(title)
    return Movie.where(:title => title)[0]
  end  
end
