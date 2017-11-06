class StaticController < ApplicationController
	def home
		if !signed_in?
			redirect_to '/sign_in'
		end
		@listings= Listing.all
	end
end