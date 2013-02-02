class CategoriesController < ApplicationController
	def show
			@category = Category.find(params[:id])
			if params[:type]
				@type = Type.find(params[:type])
				@events = category_events(@category).select { |event| event.type_id == @type.id}.uniq.sort_by(&:time)
			else
				@events = category_events(@category).uniq.sort_by(&:time)
			end
			

			@type_categories=[]

			@events.each do |event|
				@type_categories += event.categories + event_work_categories(event)
			end

			@type_categories = @type_categories.uniq.sort_by(&:name)
	end



end
