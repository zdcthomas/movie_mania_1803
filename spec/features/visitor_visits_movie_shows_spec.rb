require 'rails_helper'

RSpec.feature "VisitorVisitsMovieShows", type: :feature do
  describe 'A visitor' do
    context 'visiting the movie show page' do
      it 'should show a list of the related genres for that movie' do
        genre1 = Genre.create!(name:'Horror')
        director = Director.create!(name:'Mel Brooks')
        movie = Movie.create!(title:'spaceballs',
          description:'Things in space',
          director_id:director.id)

        movie.genres.create!(name:'SciFi')
        movie.genres.create!(name:'Comedy')
        movie.genres.create!(name:'Romance')

        visit movie_path(movie.slug)
        
        expect(page).to have_content('Genres for this Movie:')

        movie.genres.each do |genre|
          expect(page).to have_content(genre.name)
        end
      end
      it 'should show the integer rating for the movie' do
        director = Director.create!(name:'Mel Brooks')
        movie = Movie.create!(title:'spaceballs',
                              description:'Things in space',
                              director_id:director.id,
                              rating: 5)

        visit movie_path(movie.slug)
        expect(page).to have_content("Rating: #{movie.rating}")
      end
      it 'should show at least three other movies with the same rating' do
        director = Director.create!(name:'Mel Brooks(I know he didnt direct the blues brothers)')
        movie1 = Movie.create!(title:'spaceballs',
                              description:'Things in space',
                              director_id:director.id,
                              rating:5)
        movie2 = Movie.create!(title:'Blues Brothers',
                              description:'A Mission From God',
                              director_id:director.id,
                              rating:5)
        movie3 = Movie.create!(title:'Some other movie',
                              description:'stop making me think of movies!',
                              director_id:director.id,
                              rating:5)
        movie4 = Movie.create!(title:'I cant think of more movies',
                              description:'too many movies',
                              director_id:director.id,
                              rating:5)
        movie5 = Movie.create!(title:"this one shouldn't be on the list",
                              description:'sigh',
                              director_id:director.id,
                              rating:2)
        visit movie_path(movie1.slug)

        expect(page).to have_content("Similarly Rated Movies:")
        expect(page).to have_content(movie2.title)
        expect(page).to have_content(movie3.title)
        expect(page).to have_content(movie4.title)
        expect(page).to_not have_content(movie5.title)
      end
    end
  end
end
