class StaticPagesController < ApplicationController
  def home
		if user_signed_in?
			@request = current_user.requests.new
		end
  end

  def help
  end

  def about
  end
end
