require "rails_helper"

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    project = create(:project)
    expect(project).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:user) }
  end

  it "can have many members" do
    project = create(:project)
    expect(project.members.count).to be(0)

    user1 = create(:user)
    project.invite user1
    user2 = create(:user)
    project.invite user2

    expect(project.members.count).to be(2)
    expect(project.members.first.id).to be(user1.id)
    expect(project.members.last.id).to be(user2.id)
  end
end
