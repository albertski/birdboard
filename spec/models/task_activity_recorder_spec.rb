require "rails_helper"

RSpec.describe "Task Activity Recorder" do
  it "create activity on task create" do
    create(:task)
    expect(Activity.last.description).to eq("created")
  end

  it "create activity on task update" do
    task = create(:task, body: "Old Body")
    task.body = "New Body"
    task.save
    expect(Activity.last.description).to eq("updated")
    expect(Activity.last.metadata["body"]).to eq(["Old Body", "New Body"])
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
