require 'rails_helper'

RSpec.feature "VisitorVisitsGenreShowwqs", type: :feature do
  describe 'a visitor' do
    context 'visiting genre show page' do
      it 'should show all associated movies with that genre' do
        genre1 = Genre.create!(name:'Horror')
        director = Director.create!(name:'Whoever directed alien')
        genre1.movies.create(title:'Alien',
                             description:'Things in space',
                             director_id:director.id)

        genre1.movies.create(title:'Alien 2',
                            description:'More Things in space',
                            director_id:director.id)

        visit genre_path(genre1)
        
        genre1.movies.each do |movie|
          expect(page).to have_content(movie.title)
        end
      end
      it 'should show the average rating for all movies' do
        genre1 = Genre.create!(name:'Horror')
        director = Director.create!(name:'Mel Brooks')
        movie = genre1.movies.create!(title:'spaceballs',
                                      description:'Things in space',
                                      director_id:director.id,
                                      rating:5)
        movie = genre1.movies.create!(title:'spaceballs 2',
          description:'Theres a second one?',
          director_id:director.id,
          rating:3)

        movie = genre1.movies.create!(title:'spaceballs 3',
          description:'No please not another one',
          director_id:director.id,
          rating:1)

        visit genre_path(genre1)
        
        expect(page).to have_content("Average Rating: 3")
      end
      it 'should show the highest rated movie for that genre' do
        genre1 = Genre.create!(name:'Horror')
        director = Director.create!(name:'Mel Brooks')
        movie = genre1.movies.create!(title:'spaceballs',
                                      description:'Things in space',
                                      director_id:director.id,
                                      rating:5)
        movie2 = genre1.movies.create!(title:'spaceballs 2',
          description:'Theres a second one?',
          director_id:director.id,
          rating:3)

        movie3 = genre1.movies.create!(title:'spaceballs 3',
          description:'No please not another one',
          director_id:director.id,
          rating:1)

        visit genre_path(genre1)

        expect(page).to have_content("Highest Rated Movie: #{movie.title}, #{movie.rating} stars")
      end
      it 'should show the lowest rated movie for that genre' do
        genre1 = Genre.create!(name:'Horror')
        director = Director.create!(name:'Mel Brooks')
        movie = genre1.movies.create!(title:'spaceballs',
                                      description:'Things in space',
                                      director_id:director.id,
                                      rating:5)
        movie2 = genre1.movies.create!(title:'spaceballs 2',
          description:'Theres a second one?',
          director_id:director.id,
          rating:3)

        movie3 = genre1.movies.create!(title:'spaceballs 3',
          description:'No please not another one',
          director_id:director.id,
          rating:1)

        visit genre_path(genre1)

        expect(page).to have_content("Lowest Rated Movie: #{movie3.title}, #{movie3.rating} stars")
      end
    end
  end
end
