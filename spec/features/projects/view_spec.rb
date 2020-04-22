require "rails_helper"

RSpec.feature "Project", type: :feature do
  scenario "View own projects" do
    user = create(:user)
    login_as(user, scope: :user)

    project1 = create(:project, title: "First Title", user: user)
    project2 = create(:project, title: "Second Title", user: user)

    project3 = create(:project, title: "Third Title")

    visit "/projects"
    expect(page).to have_text("First Title")
    expect(page).to have_text("Second Title")
    expect(page).to have_no_text("Third Title")
  end

  scenario "View projects that member of" do
    project = create(:project, title: "My Cool New Project")
    user = create(:user)
    project.invite user
    login_as(user, scope: :user)
    visit "/projects"
    expect(page).to have_text("My Cool New Project")
  end
end
