class WorksController < ApplicationController
	def show
		@work = Work.find(params[:id])
		@events = @work.events.sort_by(&:time)
		@events = Kaminari.paginate_array(@events).page(params[:page]).per(25)
	end
end
