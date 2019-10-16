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
end
