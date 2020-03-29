require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "POST #create" do
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
end
