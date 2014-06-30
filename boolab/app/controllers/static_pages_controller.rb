class StaticPagesController < ApplicationController
  def home
  	@request = current_user.requests.new
  end

  def help
  end

  def about
  end
end
