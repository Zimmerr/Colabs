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
          response.should render_template :index
        end
    end

    describe "POST create" do
      context "with valid attributes" do
        it "creates a new list" do
          expect{
            post :create, params: {list: attributes_for(:list)}
          }.to change(List,:count).by(1)
        end
      end
      
      context "with invalid attributes" do
        it "does not save the new list" do
          expect{
            post :create, params: {list: attributes_for(:invalid_list)}
          }.to_not change(List,:count)
        end
        
      end 
    end
end
