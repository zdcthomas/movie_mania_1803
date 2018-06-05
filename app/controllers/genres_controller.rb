class GenresController < ApplicationController
  def index
    @genres = Genre.all
    @new_genre = Genre.new
    @admin = current_admin?
    # current_admin in the view was throwing a no method error
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save 
      flash[:notice] = 'genre created'
      redirect_to genres_path
    else
      flash[:error] = 'something went wrong'
      redirect_to genres_path
    end
  end
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
