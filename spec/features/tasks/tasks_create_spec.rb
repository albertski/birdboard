require "rails_helper"

RSpec.feature "Task", type: :feature do
  context "Logged In User" do
    let(:user) { create(:user) }
    before do
      login_as(user, :scope => :user)
    end

    it "Can create a new task when same user as project" do
      project = create(:project, user: user)
      visit "/projects/#{project.id}"

      task_body = "Create a new rspec test"

      fill_in "Add new task", with: task_body

      submit_form '#new_task'

      expect(page).to have_text(task_body)
      expect(page).to have_text(project.title)
    end
  end
end
