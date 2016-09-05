class Patient < ActiveRecord::Base
	belongs_to :location
	scope :is_valid, -> {where(:is_valid => 1)} 
	
	
	# 病人被查看的次数
	def increase_view_count
		update(view_count: view_count + 1)
	end
	#删除
	def marked_as_deleted
		update(is_valid: 0)
	end
	#全名
	def full_name
		"#{last_name} #{first_name} #{middle_name}"
	end
	
	#年龄
	def age
		Date.today.to_s(:number).to_i
	end
	
end

