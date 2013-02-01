class WorksController < ApplicationController
	def show
		@work = Work.find(params[:id])
		@events = @work.events.sort_by(&:time)
	end
end
