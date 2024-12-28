class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @title = "Movies"
  end
end
