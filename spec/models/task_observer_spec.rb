require "rails_helper"

RSpec.describe TaskObserver do
  it "create activity on task create" do
    create(:task)
    expect(Activity.last.description).to eq("task_created")
  end

  it "create activity on task update" do
    task = create(:task)
    task.body = "Test"
    task.save
    expect(Activity.last.description).to eq("task_updated")
  end

  it "when task is deleted activity is not deleted" do
    task = create(:task)
    expect(Activity.count).to eq(2)
    expect(Task.count).to eq(1)
    task.destroy
    expect(Activity.count).to eq(3)
    expect(Task.count).to eq(0)
  end
end
