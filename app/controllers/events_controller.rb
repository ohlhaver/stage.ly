class EventsController < ApplicationController
	

	def index
		if params[:q]
				@events = Event.search params[:q], :match_mode => :any, :order => :time,
		  :sort_mode => :asc, :with => {:time => 90.minutes.ago..60.days.from_now} 
	  	else
			@events = Event.all.sort_by(&:time)
		end

		@events = Kaminari.paginate_array(@events).page(params[:page]).per(25)


		#if params[:category]
		#	@category = Category.find(params[:category])
		#	@events = @category.events.sort_by(&:time)
		#end


		#@categories = Category.all.sort_by &:name
	end

	def show
		@event = Event.find(params[:id])
		 
		@same_artists_events = []
		@event.artists.each do |artist|
			@same_artists_events += (artist.events - Array.wrap(@event))
		end
		@same_artists_events = @same_artists_events.uniq.sort_by(&:time).first(10)


		@event_categories = event_categories(@event).uniq

		@same_categories_events = []
			@event_categories.each do |category|
				@same_categories_events += (category_events(category) - Array.wrap(@event))
			end
		@same_categories_events = @same_categories_events.uniq.sort_by(&:time).first(10)

	end




end


 