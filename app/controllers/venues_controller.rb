class VenuesController < ApplicationController
	def show
		@venue = Venue.find(params[:id])
		@events = @venue.events.sort_by(&:time)
		@events = Kaminari.paginate_array(@events).page(params[:page]).per(25)
	end

end
