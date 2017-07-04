class Movie < ActiveRecord::Base

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  validates :title, presence: true
  validates :release_date, presence: true
  validates :rating, inclusion: {in: self.all_ratings}
  validate :released_1930_or_later

  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if self.release_date < Date.parse('1 Jan 1930')
  end

  class Movie::InvalidKeyError < StandardError
  end

  Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")

  def self.find_in_tmdb(string)
    begin
      unless Tmdb::Movie.find(string).nil?
        moviesList=[]
        movieRating = nil
        Tmdb::Movie.find(string).each do |movie|
          movieRating = getRating(movie.id)
          unless movie.release_date.blank?
            moviesList << {:title => movie.title, :rating => movieRating,
                           :tmdb_id => movie.id, :release_date => movie.release_date}
          end
        end
      end
      return moviesList
    rescue Tmdb::InvalidApiKeyError
      raise Movie::InvalidKeyError, 'Invalid API key'
    end
  end

  def self.getRating(id)
    rating = nil
    Tmdb::Movie.releases(id)["countries"].each do |results|
      if results["iso_3166_1"] == "US"
        rating = results["certification"]
        break
      end
    end
    if rating.to_s.strip.length == 0
      rating = "NR"
    end
    return rating
  end

  def self.create_from_tmdb(tmdb_id)
    begin
      movieInfo = Tmdb::Movie.detail(tmdb_id)
      unless movieInfo.nil?
        rating = getRating(tmdb_id)
        if rating.to_s.strip.length.zero?
          rating = "NR"
        end
      end
      return Movie.create!(:title => movieInfo["title"], :rating => rating,
                           :description => movieInfo["overview"], :release_date => movieInfo["release_date"])
    rescue Tmdb::InvalidApiKeyError
      raise Movie::InvalidKeyError, 'Invalid ID'
    end
  end

  before_save :capitalize_title

  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join(" ")
  end

end