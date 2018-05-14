require 'rails_helper'

describe 'user_index' do
  it 'user_can_see_all_movies' do
    director = Director.create(name: "Alec Baldwin")
    movie_1 = director.movies.create(title: "Mean Girls", description: "High school girls are mean.")
    movie_2 = Movie.create!(title: "Boss Baby", description: "A baby is a boss.", director_id: director.id)
    movie_3 = Movie.create(title: "Catch Me If You Can", description: "Boy becomes expert in check fraud", director: director)

    visit '/movies'

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.description)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content(movie_2.description)
    expect(page).to have_content(movie_3.title)
    expect(page).to have_content(movie_3.description)
  end
end
