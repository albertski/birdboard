
RSpec.feature "Project", type: :feature do
  scenario "View own projects" do
    user = create(:user)
    login_as(user, scope: :user)

    create(:project, title: "First Title", user: user)
    create(:project, title: "Second Title", user: user)

    create(:project, title: "Third Title")

    visit "/projects"
    expect(page).to have_text("First Title")
    expect(page).to have_text("Second Title")
    expect(page).to have_no_text("Third Title")
  end
end
