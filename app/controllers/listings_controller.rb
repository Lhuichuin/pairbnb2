class ListingsController < ApplicationController
	before_action :require_login, except: :index

	def index
		@listings= Listing.all
		# render 'listings/index'
	end

	def new
		@listing= Listing.new
	end

	def create
		
		@listing= current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing # listing_path(@listing) , show action
		else
			render 'new' 
			# render :new
		end
	end

	def show
		@listing = Listing.find(params[:id])

	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing= Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to @listing
			
		else
			render 'edit'
		end
	end

	def destroy
		@listing= Listing.find(params[:id])
		@listing.destroy
		redirect_to @listing
	end


	private
	def listing_params
		params.require(:listing).permit(:title, :description, :property_type, :guests_capacity, :bedroom_number, :bathroom, :country, :town_city, :address, :postcode)

	end


end
