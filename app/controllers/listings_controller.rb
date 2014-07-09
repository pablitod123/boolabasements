class ListingsController < ApplicationController
	def new
		if user_signed_in?
			@listing = current_user.listings.new
		end
	end

	def create
		@listing = current_user.listings.new(listing_params)
		@listing.save
		redirect_to '/listings'
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def show
		redirect_to '/'
	end

	def update
	  @listing = Listing.find(params[:id])
	 
	  if @listing.update(listing_params)
	    redirect_to '/listings'
	  else
	    render 'edit'
	  end
	end

	def index
		if user_signed_in?
		@listings = current_user.listings.all.reverse
		else
		redirect_to '/'
		end
	end

	def listing_params
		params.require(:listing).permit(:datein, :dateout, :location, :user_id, :description, :price)
	end

	def destroy
		Listing.find(params[:id]).destroy
		flash[:success] = "Congrats Dude!"
		redirect_to '/listings'
	end
end
