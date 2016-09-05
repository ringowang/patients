require 'rails_helper'

RSpec.describe "Patients", type: :routing do
  before(:each) do 
    FactoryGirl.create(:patient_valid)
  end
  
  it "should route to 'index'" do

  expect(:get => patients_path)
    .to route_to(
    controller: "patients",
    action: "index"
  )
end

 
  it "should route to 'new'" do

    expect(:get => new_patient_path)
      .to route_to(
      controller: "patients",
      action: "new"
    )
  end
  
  it "should route to 'edit'" do

    expect(:get => edit_patient_path(1))
      .to route_to(
      controller: "patients",
      action: "edit",
      id: "1"
    )
  end
  
  it "should route to 'show'" do

    expect(:get => patient_path(1))
      .to route_to(
      controller: "patients",
      action: "show",
      id: "1"
    )
  end

  it "should route to 'create'" do

  expect(:post => patients_path)
    .to route_to(
    controller: "patients",
    action: "create"
  )
  end
  
  it "should route to 'update'" do

  expect(:put => patient_path(1))
    .to route_to(
    controller: "patients",
    action: "update",
    id: "1"
  )
  end
  

    
 end
