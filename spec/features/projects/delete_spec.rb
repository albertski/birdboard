require "rails_helper"

RSpec.feature "Project", type: :feature do
  context "Logged In User" do
    before do
      @user = create(:user)
      login_as(@user, :scope => :user)
    end

    scenario "should be able to delete project" do
      project = create(:project, title: "Cool Project", user: @user)
      visit "/projects"
      expect(page).to have_text("Cool Project")
      visit "/projects"
      click_link "Delete"
      expect(page).to have_current_path "/projects"
      expect(page).not_to have_text("Cool Project")
    end
  end
end
