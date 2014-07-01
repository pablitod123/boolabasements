class ListingsController < ApplicationController
	def new
		if user_signed_in?
			@listing = current_user.listings.new
		end
	end

	def create
		@listing = current_user.listings.new(listing_params)
		@listing.save
	end

	def index
		@listings = Listing.all
	end

	def listing_params
		params.require(:listing).permit(:datein, :dateout, :user_id)
	end
end