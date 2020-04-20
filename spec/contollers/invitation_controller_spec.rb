require "rails_helper"

RSpec.describe Projects::InvitationController, type: :controller do
  describe "Logged in user" do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    context "that is project owner" do
      let(:project) { create(:project, user: user) }

      context 'POST #create' do
        context "with valid attributes" do
          let(:new_user) { create(:user) }

          it "it invites a user" do
            post :create, params: { project_id: project, email: new_user.email }
            expect(project.members.first.email).to eq(new_user.email)
          end
        end

        context "with invalid email" do
          let(:new_user) { create(:user, email: 'test@test.com') }

          it "does not inviate a user" do
            post :create, params: { project_id: project, email: "test2@yahoo.com"}
            expect(project.members.count).to eq(0)
          end
        end
      end
    end
  end
end
