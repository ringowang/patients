FactoryGirl.define do
  factory :patient_valid, class: 'Patient' do
    id 1
    first_name "博果"
    last_name "王"
    status "Closed"
    location_id 1
  end

  factory :patient_invalid, class: 'Patient' do
    id 2
    first_name "s"
    last_name ""

  end
end
