class ReviewsController < ApplicationController
	def index
		if params[:book_id]
			@reviews = Review.where(book_id: params[:book_id])
		else
			@reviews = Review.all
		end
	end

	def new
		@review = Review.new(book_id: params[:book_id])	
	end

	def create
		@review = Review.new(review_params)
		if @review.save
			redirect_to book_reviews_path(params[:book_id])
		else
			render :new
		end
	end

	def review_params
		params.require(:review).permit(:title, :content, :author_name, :written_at, :rating, :book_id)
	end

end
