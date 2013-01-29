class CategoriesController < ApplicationController
	def show
			@category = Category.find(params[:id])
			@events = @category.events.uniq.sort_by(&:time)
	end
end
