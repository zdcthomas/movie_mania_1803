require 'rails_helper'

describe "As a user when I visit /actors/new" do
  it "I can see a form for a new director" do
    visit new_actor_path

    expect(page).to have_content("Name")
  end

  it "I can create a new director" do
    visit new_actor_path

    fill_in 'actor[name]', with: "Tom Hanks"
    click_on "Create Actor"

    expect(current_path).to eq(actors_path)
    expect(page).to have_content("Tom Hanks")
  end

end
