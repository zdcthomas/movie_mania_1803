require 'rails_helper'

RSpec.feature "AnAdminVisitsGenres", type: :feature do
  describe 'an admin' do
    context 'visiting the genres index page' do
      it 'should show a list of all genres' do
        genre1 = Genre.create!(name:'Horror')
        genre2 = Genre.create!(name:'RomCom')
        genre3 = Genre.create!(name:'Comedy')
        genre4 = Genre.create!(name:'SciFi')
        admin = User.create!(username:"admin", role:1, password:'password')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit genres_path

        Genre.all.each do |genre|
          expect(page).to have_content(genre.name)
        end
      end
      it 'should have a form to create a new genre' do 
        genre1 = Genre.create!(name:'Horror')
        genre2 = Genre.create!(name:'RomCom')
        genre3 = Genre.create!(name:'Comedy')
        genre4 = Genre.create!(name:'SciFi')
        admin = User.create!(username:"admin", role:1, password:'password')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit genres_path

        expect(page).to have_field('genre[name]')
        expect(page).to have_button('Create Genre')
      end
      it 'should create a new genre after filling out the form' do
        genre1 = Genre.create!(name:'Horror')
        genre2 = Genre.create!(name:'RomCom')
        genre3 = Genre.create!(name:'Comedy')
        genre4 = Genre.create!(name:'SciFi')
        admin = User.create!(username:"admin", role:1, password:'password')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit genres_path

        name = "Musical"
        fill_in'genre[name]', with: name
        click_on('Create Genre')

        expect(current_path).to eq(genres_path)
        expect(page).to have_content(name)
      end
    end
  end
end
