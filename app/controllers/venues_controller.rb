class VenuesController < ApplicationController
	def show
		@venue = Venue.find(params[:id])
		@events = @venue.events.sort_by(&:time)
	end

end
