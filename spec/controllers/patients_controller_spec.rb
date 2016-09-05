require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  before(:each) {
    @patient_valid = FactoryGirl.create(:patient_valid)
  }
  
  it "should view index" do 
    get :index
    expect(response).to render_template('index')
  end
  
  it "should view show" do 
    get :show, id: 1
    expect(response).to render_template('show')
  end
  
  it "should view new" do 
    get :new
    expect(response).to render_template('new')
  end
  
  it "should view edit" do 
    get :edit, id: 1
    expect(response).to render_template('edit')
  end

  it "should update" do 
    patch :update, id: 1, patient: {location_id: 2}
    expect(assigns(:patient).location_id).to eq 2
  end
 
end
