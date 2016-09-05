require 'rails_helper'
RSpec.describe "Patients", type: :feature do

feature "as a user, I should be able to visit all pages", type: :feature do
  
  scenario "I should be able to create location" do
   FactoryGirl.create(:location_valid)
    visit new_location_path
    expect{
      fill_in('location[name]', with: 'Test')
      click_button 'Submit' 
     }.to change(Location, :count).to(2)
  end
  
/# 地址怎么都无法被find
  scenario "I should be able to create_location" do
    location = create(:location)
    visit new_patient_path
    expect{
      fill_in('patient[first_name]', with: '1')
      fill_in('patient[middle_name]', with: '2')
      fill_in('patient[last_name]', with: '3')
      find("option[value='Closed']").click
      find("option[value='Test location 1']").click
      choose 'Male'
      click_button 'Submit' 
     }.to change(Patient, :count).by(1)
  end
#/
 
   scenario 'I should be able to check for locations' do
     visit root_url
     click_link('Check for Locations')
     expect(current_path).to eq locations_path
   end
 
   scenario 'I should be able to create patients' do
      @patient_valid = FactoryGirl.create(:patient_valid)
      visit root_url
      click_link_or_button('Add New Patient')
      expect(current_path).to eq new_patient_path
   end

end
end


