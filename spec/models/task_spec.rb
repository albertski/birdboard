require "rails_helper"

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    task = create(:task)
    expect(task).to be_valid
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:project) }
    it { is_expected.to validate_presence_of(:user) }
  end
end
