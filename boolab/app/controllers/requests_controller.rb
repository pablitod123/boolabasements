class RequestsController < ApplicationController
	def new
		@request = current_user.requests.new
	end

	def create
		@request = current_user.requests.new(request_params)
		@request.save
	end

	def request_params
		params.require(:request).permit(:datein, :dateout, :user_id)
	end
end
