class CategoriesController < ApplicationController
	def show
			@category = Category.find(params[:id])
			if params[:type]
				@type = Type.find(params[:type])
				@events = category_events(@category).where(:type_id => @type.id).uniq.sort_by(&:time)
			else
				@events = category_events(@category).uniq.sort_by(&:time)
			end
			

			@type_categories=[]

			@events.each do |event|
				@type_categories += event.categories
			end

			@type_categories = @type_categories.uniq.sort_by(&:name)
	end

	def category_events(category)
		cats =[]
		category.works.each do |work|
			cats += work.events 
		end
		cats += category.events
	end
end
