class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  class Movie::InvalidKeyError < StandardError;
  end

  # Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")

  def self.find_in_tmdb(string)
    # begin
    #   if Tmdb::Movie.find(string) != nil
    #     moviesList=[]
    #     movieRating = nil
    #     Tmdb::Movie.find(string).each do |movie|
    #       movieRating = getRating(movie.id)
    #       if !movie.release_date.blank?
    #         moviesList << {:title => movie.title, :rating => movieRating, :tmdb_id => movie.id, :release_date => movie.release_date}
    #       end
    #     end
    #   end
    #   return moviesList
    # rescue Tmdb::InvalidApiKeyError
    #   raise Movie::InvalidKeyError, 'Invalid API key'
    # end
  end
end