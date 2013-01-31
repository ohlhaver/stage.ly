class TypesController < ApplicationController
		def show
			@type = Type.find(params[:id])
			@events = @type.events.uniq.sort_by(&:time)

			@type_categories=[]

			@events.each do |event|
				@type_categories += event.categories
			end

			@type_categories = @type_categories.uniq.sort_by(&:name)

		end
end
