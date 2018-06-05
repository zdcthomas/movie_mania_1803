require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'instance methods' do
    describe 'average_rating' do
      it 'should return the average movie rating' do
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

        expect(genre1.average_rating).to eq(3)
      end
    end
    describe 'highest_rated' do
      it 'should return the highest rated movie' do
        genre = Genre.create!(name:'Horror')
        director = Director.create!(name:'Mel Brooks')
        movie = genre.movies.create!(title:'spaceballs',
                                      description:'Things in space',
                                      director_id:director.id,
                                      rating:5)

        movie2 = genre.movies.create!(title:'spaceballs 2',
                                      description:'Theres a second one?',
                                      director_id:director.id,
                                      rating:3)

        movie3 = genre.movies.create!(title:'spaceballs 3',
                                        description:'No please not another one',
                                        director_id:director.id,
                                        rating:1)

        expect(genre.highest_rated.title).to eq(movie.title)
      end
    end
    describe 'lowest_rated' do
      it 'should return the lowest rated movie' do
        genre = Genre.create!(name:'Horror')
        director = Director.create!(name:'Mel Brooks')
        movie = genre.movies.create!(title:'spaceballs',
                                      description:'Things in space',
                                      director_id:director.id,
                                      rating:5)

        movie2 = genre.movies.create!(title:'spaceballs 2',
                                      description:'Theres a second one?',
                                      director_id:director.id,
                                      rating:3)

        movie3 = genre.movies.create!(title:'spaceballs 3',
                                        description:'No please not another one',
                                        director_id:director.id,
                                        rating:1)

        expect(genre.lowest_rated.title).to eq(movie3.title)
      end
    end
  end
end
