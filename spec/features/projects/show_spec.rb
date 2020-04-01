
RSpec.feature "Project", type: :feature do
  scenario "View own project" do
    user = create(:user)
    login_as(user, scope: :user)

    project = create(:project, title: "New Project", description: "Cool new feature", user: user)

    visit "/projects/#{project.id}"

    expect(page).to have_text(project.title)
    expect(page).to have_text(project.description)
  end

  scenario "Can't view other users projects" do
    user = create(:user)
    project = create(:project, title: "Other Users Project")
    visit "/projects/#{project.id}"

    expect(page).not_to have_text(project.title)
  end
end
