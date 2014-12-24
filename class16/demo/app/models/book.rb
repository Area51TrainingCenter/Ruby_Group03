class Book < ActiveRecord::Base

	validates :title, :description, presence: true

	belongs_to :author
	has_many :book_categories
	has_many :categories, through: :book_categories

	def mark_to_read
		# ......
	end

	def to_param
		id.to_s + "-" + title.parameterize
	end

end
