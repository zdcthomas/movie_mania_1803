require 'rails_helper'

RSpec.feature "VisitorVisitsMovieShows", type: :feature do
  descirbe 'A visitor' do
    context 'visiting the movie show page' do
      it 'should show a list of the related genres for that movie' do
        genre1 = Genre.create!(name:'Horror')
        director = Director.create!(name:'Mel Brooks')
        movie = Movie.create!(title:'spaceballs',
          description:'Things in space',
          director_id:director.id)

        movie.genre.create!(name:'SciFi')
        movie.genre.create!(name:'Comedy')
        movie.genre.create!(name:'Romance')

        visit movie_path(movie)
        
        expect(page).to have_content('Genres for this Movie:')

        movie.genres.each do |genre|
          expect(page).to have_content(genre.name)
        end
      end
    end
  end
end
