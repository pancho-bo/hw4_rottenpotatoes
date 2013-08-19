class Movie < ActiveRecord::Base

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_same_director(movie_id)
    dir = Movie.find_by_id(movie_id).director
    return nil if (not dir) or dir =~ /^\s*$/
    Movie.find_all_by_director(dir)
  end

end
