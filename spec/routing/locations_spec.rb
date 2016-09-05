require 'rails_helper'

RSpec.describe "Locations", type: :routing do
  before(:each) do 
    FactoryGirl.create(:location_valid)
  end
  
  it "should route to 'index'" do

  expect(:get => locations_path)
    .to route_to(
    controller: "locations",
    action: "index"
  )
end

 
  it "should route to 'new'" do

    expect(:get => new_location_path)
      .to route_to(
      controller: "locations",
      action: "new"
    )
  end
  
  it "should route to 'edit'" do

    expect(:get => edit_location_path(1))
      .to route_to(
      controller: "locations",
      action: "edit",
      id: "1"
    )
  end
  
  it "should route to 'show'" do

    expect(:get => location_path(1))
      .to route_to(
      controller: "locations",
      action: "show",
      id: "1"
    )
  end

  it "should route to 'create'" do

  expect(:post => locations_path)
    .to route_to(
    controller: "locations",
    action: "create"
  )
  end
  
  it "should route to 'update'" do

  expect(:put => location_path(1))
    .to route_to(
    controller: "locations",
    action: "update",
    id: "1"
  )
  end
  

    
 end
