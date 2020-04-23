require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  describe "Logged in user" do
    before do
      @user = create(:user)
      sign_in @user
    end

    describe 'POST #create' do
      context "with valid attributes" do
        it "creates a new project" do
          post :create, params: { project: attributes_for(:project) }
          expect(Project.count).to eq(1)
        end
      end

      context "with invalid attributes" do
        it "does not create a new project" do
          post :create, params: { project: { title: nil, description: nil } }
          expect(Project.count).to eq(0)
        end
      end
    end

    describe 'DELETE #destroy' do
      it "can delete project" do
        project = create(:project, user: @user)
        expect(Project.count).to eq(1)
        delete :destroy, params: { id: project.id }
        expect(Project.count).to eq(0)
      end
    end
  end

  describe "Logged out user" do
    it "cannot create a new project" do
      post :create, params: { project: attributes_for(:project) }
      expect(Project.count).to eq(0)
    end

    it "cannot delete a project" do
      project = create(:project)
      delete :destroy, params: { id: project.id }
      expect(Project.count).to eq(1)
    end
  end
end
