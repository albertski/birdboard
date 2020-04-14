require "rails_helper"

RSpec.describe ProjectObserver, type: :model do
  it "create activity on project create" do
    project = create(:project)
    expect(Activity.first.description).to eq("project_created")
  end

  it "create activity on project update" do
    project = create(:project, title: "Old Title")
    project.title = "New Title"
    project.save
    expect(Activity.last.description).to eq("project_updated")
    expect(Activity.last.metadata["title"]).to eq(["Old Title", "New Title"])
  end

  it "deletes activity when project is deleted" do
    project = create(:project)
    project.delete
    expect(Activity.last).to eq(nil)
  end
end
