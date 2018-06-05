require 'rails_helper'

describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to(:director)}
    it {should have_many(:actors).through(:actor_movies)}
  end

  describe 'instance methods' do
    it 'should generate a slug for a new movie' do
      director = Director.create(name: 'foo')
      movie = director.movies.create(title: 'Jurassic Park', description: 'blah')

      expect(movie.slug).to eq(movie.title.parameterize)
    end
    describe 'similarly_rated' do
      it 'should return similarly rated movies' do
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

        movie1.similarly_rated.each do |movie|
          expect(movie.rating).to eq(movie1.rating)
        end
      end
    end
  end
end
