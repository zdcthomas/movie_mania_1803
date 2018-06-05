require 'rails_helper'

RSpec.feature "AVisitorVisitsGenres", type: :feature do
  describe 'A Visitor' do
    context 'visiting the genres index' do
      it 'shouldnt show the genre creation form' do
        genre1 = Genre.create!(name:'Horror')
        genre2 = Genre.create!(name:'RomCom')
        genre3 = Genre.create!(name:'Comedy')
        genre4 = Genre.create!(name:'SciFi')

        visit genres_path

        Genre.all.each do |genre|
          expect(page).to have_link(genre.name)
        end
        expect(page).to_not have_field('genre[name]')
        expect(page).to_not have_button('Create Genre')
      end
    end
  end
end
