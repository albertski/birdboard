require "rails_helper"

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    project = create(:project)
    expect(project).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
