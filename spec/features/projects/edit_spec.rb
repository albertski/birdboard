RSpec.feature "Project", type: :feature do
  scenario "Login User with project can edit project" do
    user = create(:user)
    login_as(user, scope: :user)

    project = create(:project, title: "New Project", description: "Cool new feature", user: user)
    visit "/projects/#{project.id}"
    notes = "My new notes"
    fill_in "project[notes]", with: notes
    click_button "Update Project"
    expect(page).to have_text(notes)
  end
end
