require 'rails_helper'

RSpec.describe ProjectUsersController, type: :controller do
    context "When on the project_users/edit page" do
        it "should change the authority of a user in a project" do
            click_button "Trocar nivel"
            
        end
    end
end