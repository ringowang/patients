class Location < ActiveRecord::Base
	has_many :patients
	
	validates :name, presence: true, length: { maximum: 80}
	validates :code, length: { maximum: 10 }
	
end
