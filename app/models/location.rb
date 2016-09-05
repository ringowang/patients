class Location < ActiveRecord::Base
	has_many :patients
	scope :is_valid, -> {where(:is_valid => 1)} 
	
	validates :name, presence: true, length: { maximum: 80}
	validates :code, length: { maximum: 10 }
	
	def marked_as_deleted
		update(is_valid: 0)
	end
	
end
