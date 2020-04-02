require "rails_helper"

RSpec.feature "Project", type: :feature do
  context "Logged In User" do
    before do
      user = create(:user)
      login_as(user, :scope => :user)
    end

    scenario "Can create a new project" do
      visit "/projects/new"

      fill_in "Title", with: "My Title"
      fill_in "Description", with: "Project Description"

      click_button "Create Project"

      expect(page).to have_text("My Title")
    end
  end

  context "Logged Out User" do
    scenario "Can't create a new project" do
      visit "/projects/new"
     # expect(page).not_to have_text("You must be logged in to perform this action")
      expect(page).to have_current_path "/"
    end
  end
end
