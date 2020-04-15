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
    activity = Activity.last
    expect(activity.description).to eq("updated")
    expect(activity.user).to eq(task.user)
    expect(activity.metadata["body"]).to eq(["Old Body", "New Body"])
  end
end
