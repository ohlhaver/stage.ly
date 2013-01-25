class CategoriesController < ApplicationController
	def show
			@category = Category.find(params[:id])
			@events = @category.events.sort_by(&:time)
	end
end
