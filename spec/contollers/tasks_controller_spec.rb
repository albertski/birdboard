require "rails_helper"

RSpec.describe Projects::TasksController, type: :controller do
  describe "Logged in user can POST #create" do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    context "With project associated with logged in user" do
      let(:project) { create(:project, user: user) }

      context "with valid attributes" do
        it "creates a new task" do
          post :create, params: { project_id: project, task: attributes_for(:task) }
          expect(Task.count).to eq(1)
        end
      end

      context "with invalid attributes" do
        it "does not create a new task" do
          post :create, params: { project_id: project, task: { body: nil } }
          expect(Task.count).to eq(0)
        end
      end
    end

    context "with project NOT associated with logged in user" do
      let(:project) { create(:project) }

      context "with valid attributes" do
        it "creates a new task" do
          post :create, params: { project_id: project, task: attributes_for(:task) }
          expect(Task.count).to eq(0)
        end
      end
    end
  end

  describe "Logged out user cannot POST #create" do
    let(:project) { create(:project) }
    it "create a new task" do
      post :create, params: { project_id: project, task: attributes_for(:task) }
      expect(Task.count).to eq(0)
    end
  end
end
