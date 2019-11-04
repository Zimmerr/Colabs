require 'rails_helper'

RSpec.describe ListsController, type: :controller do
    describe "GET #index" do
        before :each do
            @project = create(:project)
            params = {:project_id => @project.id}
            get :index, params: params
        end

        it "populates an array of lists" do
          assigns(:lists).should eq(@project.lists)
        end

        it "renders the :index view" do
          response.should render_template :indexs
        end
    end

    describe "POST delete" do
      context "containing a task" do
        it "does not delete the list" do
          l = create(:list_with_tasks)
          expect{
            post :destroy, params: {id: l[:id]}
          }.to_not change(List,:count)
        end
      end

      context "not containing any tasks" do
        it "does delete the list" do
          l = create(:list)
          expect{
            post :destroy, params: {id: l[:id]}
          }.to change(List,:count).by(-1)
        end

      end
    end

    describe "POST create" do
      context "with valid attributes" do
        it "creates a new list" do
          l = attributes_for(:list)
          expect{
            post :create, params: {list: l, project_id: l[:project_id]}
          }.to change(List,:count).by(1)
        end
      end

      context "with invalid attributes" do
        it "does not save the new list" do
          l = attributes_for(:invalid_list)
          expect{
            post :create, params: {list: l, project_id: l[:project_id]}
          }.to_not change(List,:count)
        end

      end
    end
end
