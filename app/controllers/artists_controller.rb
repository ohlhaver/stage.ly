class ArtistsController < ApplicationController
	def show
		@artist = Artist.find(params[:id])
		@events = @artist.events.sort_by(&:time)
		@events = Kaminari.paginate_array(@events).page(params[:page]).per(25)
	end

end
