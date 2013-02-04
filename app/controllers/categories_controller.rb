class CategoriesController < ApplicationController
	def show
			@category = Category.find(params[:id])
			#@events = Event.search :conditions => {:categories => @category.name}, :match_mode => :any, :order => :time,
		  #:sort_mode => :asc
			if params[:type]
				@type = Type.find(params[:type])
			#	@type_events = @type.events.uniq.sort_by(&:time)
				@events = category_events(@category).select { |event| event.type_id == @type.id}.uniq.sort_by(&:time)
						@type_categories = @type.categories#@type_categories.uniq.sort_by(&:name)
			else
			
				@events = category_events(@category).uniq.sort_by(&:time)
			#	@type_events = @events
			end
			
			
			#@type_categories=[]

			#@type_events.each do |event|
			#	@type_categories += event_categories(event)
			#end


	end



end
