require 'rails_helper'

RSpec.feature "Project", :type => :feature do
  scenario "View a new project" do
    create(:project, title: "First Title")
    create(:project, title: "Second Title")
    visit "/projects"
    expect(page).to have_text("First Title")
    expect(page).to have_text("Second Title")
  end
end
