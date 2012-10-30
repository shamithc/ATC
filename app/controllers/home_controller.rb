class HomeController < ApplicationController
  def index
  	@name = "Prasoon"
  	@brand = Brand.all
  	# render :text => "session" 	
  end
end

