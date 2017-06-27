
class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movies = nil
  end

end