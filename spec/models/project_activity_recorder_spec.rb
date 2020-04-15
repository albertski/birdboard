require "rails_helper"

RSpec.describe "Project Activity Recorder" do
  it "create activity on project create" do
    project = create(:project)
    expect(Activity.first.description).to eq("created")
  end

  it "create activity on project update" do
    project = create(:project, title: "Old Title")
    project.title = "New Title"
    project.save
    activity = Activity.last;
    expect(activity.description).to eq("updated")
    expect(activity.user).to eq(project.user)
    expect(activity.metadata["title"]).to eq(["Old Title", "New Title"])
  end

  it "deletes activity when project is deleted" do
    project = create(:project)
    project.delete
    expect(Activity.last).to eq(nil)
  end
end
