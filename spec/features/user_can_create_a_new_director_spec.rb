require 'rails_helper'

describe "As a user when I visit /directors/new" do
  it "I can see a form for a new director" do
    visit new_director_path

    expect(page).to have_content("Name")
  end

  it "I can create a new director" do
    visit new_director_path

    fill_in 'director[name]', with: "Sam"
    click_on "Create Director"

    expect(page).to have_content("Sam")
  end

end
