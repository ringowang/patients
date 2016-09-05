require 'rails_helper'

RSpec.describe Patient, type: :model do
   before(:each) { 
    @patient_valid = FactoryGirl.build(:patient_valid) 
    @patient_invalid = FactoryGirl.build(:patient_invalid)
  }

  it "should be valid" do 
    expect(@patient_valid).to be_valid
  end

  it "should be invalid" do 
    expect(@patient_invalid).to be_invalid
  end
  
  it "is invalid without a first_name" do
    @patient_valid.first_name = nil
    @patient_valid.valid?
    expect(@patient_valid.errors[:first_name]).to include("can't be blank")
  end
   
  it "is invalid with a first_name has more than 30 characters" do
     @patient_valid.first_name = 'w' * 31
     @patient_valid.valid?
     expect(@patient_valid.errors[:first_name]).to include("is too long (maximum is 30 characters)")
  end
  
  it "is invalid with a middle_name has more than 10 characters" do
     @patient_valid.middle_name = 'w' * 11
     @patient_valid.valid?
     expect(@patient_valid.errors[:middle_name]).to include("is too long (maximum is 10 characters)")
  end
  
  it "is invalid with a first_name has more than 30 characters" do
     @patient_valid.last_name = 'w' * 31
     @patient_valid.valid?
     expect(@patient_valid.errors[:last_name]).to include("is too long (maximum is 30 characters)")
  end
  
  it "is invalid without a last_name" do
    @patient_valid.last_name= nil
    @patient_valid.valid?
    expect(@patient_valid.errors[:last_name]).to include("can't be blank")
  end
  
  it "is invalid without a status" do
    @patient_valid.status= nil
    @patient_valid.valid?
    expect(@patient_valid.errors[:status]).to include("can't be blank")
  end

  it "is invalid without a location_id" do
     @patient_valid.location_id= nil
     @patient_valid.valid?
    expect(@patient_valid.errors[:location_id]).to include("can't be blank")
  end
    

end
