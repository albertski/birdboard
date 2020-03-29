
RSpec.feature "Project", type: :feature do
  scenario "View a new project" do
    project = create(:project, title: "New Project", description: "Cool new feature")

    visit "/projects/#{project.id}"

    expect(page).to have_text(project.title)
    expect(page).to have_text(project.description)
  end
end
