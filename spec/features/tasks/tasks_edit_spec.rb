require "rails_helper"

RSpec.feature "Task", type: :feature do
  context "Logged In User" do
    let(:task) { create(:task, completed: 0) }
    before do
      login_as(task.project.user, :scope => :user)
    end

    it "can edit a task" do
      visit "/projects/#{task.project.id}"
      expect(find('.edit_task .task-completed').checked?).to eq false

      task_body = "Create a new rspec test"

      find('.edit_task .task-body').set(task_body)
      find('.edit_task .task-completed').set(1)

      submit_form "#edit_task_#{task.id}"

      expect(find('.edit_task .task-completed').checked?).to eq true
      expect(find('.edit_task .task-body').value).to eq task_body
    end
  end
end
