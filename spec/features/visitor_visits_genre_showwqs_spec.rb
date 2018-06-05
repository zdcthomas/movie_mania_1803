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
    end
  end
end
