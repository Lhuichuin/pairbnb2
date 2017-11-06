class ListingsController < ApplicationController
	before_action :require_login, except: :index
	before_action :allowed?, only: [:verify]

	def index
		# render 'listings/index'

		respond_to do |format|
			format.html
			format.js
		end

# search bar
		if params[:searchtitle] || params[:searchcountry]
			@listings = Listing.search(params[:searchtitle], params[:searchcountry]).order('created_at DESC')
		else
			@listings= Listing.all.order('created_at DESC')
		end

		@listings= @listings.paginate(:page => params[:page], :per_page => 12)
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

	
	def verify
		if current_user.customer?
			flash[:notice] = "Sorry. You are not allowed to perform this action."
			return redirect_to listings_path
		else
			@listing= Listing.find(params[:id])
			@listing.update(verification: true)
			flash[:notice] = "This property has been verified!"
			redirect_to listings_path
		end
	end



	private
	def listing_params
		params.require(:listing).permit(:title, :description, :property_type, :guests_capacity, :bedroom_number, :bathroom, :country, :town_city, :address, :postcode, :tag_list,:prices, amenity_list: [], photos: [])

	end

	def allowed?
		return !current_user.customer?
	end

end
