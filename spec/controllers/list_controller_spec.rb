require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  before :each do
    user = create(:user)
    login(user)
  end

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
          response.should render_template :index
        end
    end

    describe "GET #edit" do
      before :each do
          @l = create(:list)
          params = {project_id: @l[:project_id], list_id: @l[:id]}
          puts params
          get :edit, params: params
      end

      it "brings up a list" do
        assigns(:list).should eq(@l)
      end

      it "renders the :index view" do
        response.should render_template :index
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

    describe "PUT update" do
      context "with valid attributes" do
        it "edits the list" do
          l = create(:list)
          new_l = attributes_for(:list_with_tasks)
          l.name = new_l[:name]
          l.desc = new_l[:desc]
          id = l.id
          put :update, params: {list: new_l, project_id: l[:project_id], list_id: l[:id]}
          l_bd = List.find(id)
          expect(l_bd.name).to eq(l.name)
          expect(l_bd.desc).to eq(l.desc)
          expect(l_bd.id).to eq(l.id)
        end
      end

      context "with invalid name" do
        it "does not save the new name" do
          l = create(:list)
          new_l = attributes_for(:invalid_list)
          l.name = new_l[:name]
          l.desc = new_l[:desc]
          id = l.id
          put :update, params: {list: new_l, project_id: l[:project_id], list_id: l[:id]}
          l_bd = List.find(id)
          expect(l_bd.name).not_to eq(l.name)
          expect(l_bd.id).to eq(l.id)
        end

      end
    end
end
