class ArtistsController < ApplicationController
	def show
		@artist = Artist.find(params[:id])
		@events = @artist.events.sort_by(&:time)
	end

end
