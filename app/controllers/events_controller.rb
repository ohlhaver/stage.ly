class EventsController < ApplicationController
	def index
		@events = Event.all.sort_by(&:time)
		if params[:category]
			@category = Category.find(params[:category])
			@events = @category.events.sort_by(&:time)
		end


		#@categories = Category.all.sort_by &:name
	end

	def show
		@event = Event.find(params[:id])
	end

end


 