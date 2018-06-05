class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @new_genre = Genre.new
  end
  
  def create

  end
end
