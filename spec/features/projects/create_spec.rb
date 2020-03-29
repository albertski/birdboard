require "rails_helper"

RSpec.feature "Project", type: :feature do
  scenario "Create a new project" do
    visit "/projects/new"

    fill_in "Title", with: "My Title"
    fill_in "Description", with: "Project Description"

    click_button "Create Project"

    expect(page).to have_text("My Title")
  end
end
