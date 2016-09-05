require 'rails_helper'

RSpec.describe Location, type: :model do
   before(:each) { 
    @location_valid = FactoryGirl.build(:location_valid) 
    @location_invalid = FactoryGirl.build(:location_invalid)
    @location_invalid2 = FactoryGirl.build(:location_invalid2)
  }

  it "should be valid" do 
    expect(@location_valid).to be_valid
  end

  it "should be invalid" do 
    expect(@location_invalid).to be_invalid
  end
  
  
  it "should be invalid too" do 
    expect(@location_invalid2).to be_invalid
  end
  
  it "is invalid without a name" do
    @location_valid.name = nil
    @location_valid.valid?
    expect(@location_valid.errors[:name]).to include("can't be blank")
  end
  
  it "is invalid with a name has more than 80 characters" do
     @location_valid.name = 'w' * 81
     @location_valid.valid?
     expect(@location_valid.errors[:name]).to include("is too long (maximum is 80 characters)")
  end
  
  it "is invalid with a code has more than 1 characters" do
   @location_valid.code = 'w' * 11
   @location_valid.valid?
   expect(@location_valid.errors[:code]).to include("is too long (maximum is 10 characters)")
   end
end
