class Book < ActiveRecord::Base

	validates :title, :description, presence: true


	def mark_to_read
		# ......
	end

end
