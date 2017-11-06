class ReservationsController < ApplicationController
	before_action :require_login


	def index
		@reservations =Listing.find(params[:listing_id]).reservations
	end

	def new
		@reservation= Reservation.new
		@listing= Listing.find(params[:listing_id])
	end

	def create
		@reservation= current_user.reservations.new(reservation_params)
		@reservation.listing= Listing.find(params[:listing_id])

		if (@reservation.start_date == nil)|| (@reservation.end_date == nil)
			flash[:notice] = "Your dates are incorrect"
			render 'new'
		else
			@reservation.save
			ReservationJob.perform_later(@reservation.user, @reservation.listing.user, @reservation.id)
			redirect_to @reservation
		end

	end

	def show
		@reservation = Reservation.find(params[:id])
		
	end

	private
	def reservation_params
		params.require(:reservation).permit(:number_of_guests, :start_date, :end_date)
	end

end
