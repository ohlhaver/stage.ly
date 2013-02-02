class CategoriesController < ApplicationController
	def show
			@category = Category.find(params[:id])
			if params[:type]
				@type = Type.find(params[:type])
				@type_events = @type.events.uniq.sort_by(&:time)
				@events = category_events(@category).select { |event| event.type_id == @type.id}.uniq.sort_by(&:time)
			else
				@events = category_events(@category).uniq.sort_by(&:time)
				@type_events = @events
			end
			
			
			@type_categories=[]

			@type_events.each do |event|
				@type_categories += event_categories(event)
			end

			@type_categories = @type_categories.uniq.sort_by(&:name)
	end



end
