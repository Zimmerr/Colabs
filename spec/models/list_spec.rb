require 'rails_helper'

RSpec.describe List, type: :model do
  it "é válido quando nome está presente" do 
    l = build(:list) 
     
     expect(l).to be_valid 
  end 

  it "é inválido quando nome não está presente" do
    l = build(:invalid_list)
    expect(l).to_not be_valid
  end

  describe "method isDeletable on a list" do
    context "containing a task" do
      it "returns false" do
        l = create(:list_with_tasks)
        expect(
          l.isDeletable
        ).to be false
      end
    end
    
    context "not containing any tasks" do
      it "returns true" do
        l = create(:list)
        expect(
          l.isDeletable
        ).to be true
      end
      
    end 
  end
end
