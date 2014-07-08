class RequestsController < ApplicationController
	def new
		if user_signed_in?
			@request = current_user.requests.new
		end
	end

	def create
		@request = current_user.requests.new(request_params)
		@request.save
		redirect_to "/requests"
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def request_params
		params.require(:request).permit(:datein, :dateout, :user_id)
	end
end
