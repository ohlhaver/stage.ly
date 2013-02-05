class TypesController < ApplicationController
		def show
			@type = Type.find(params[:id])
			@events = @type.events.sort_by(&:time)
			@events = Kaminari.paginate_array(@events).page(params[:page]).per(25)

			#@type_categories=[]

			#@events.each do |event|
		#		@type_categories += event_categories(event)
		#	end

			@type_categories = @type.categories.sort_by(&:name)

		end
end
