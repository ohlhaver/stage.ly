class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :event_work_categories

  	def category_events(category)
		cats=[]
		category.works.each do |work|
			cats += work.events 
		end
		cats += category.events
		return cats
	end

	def event_work_categories(event)
		cats=[]
		if event.works.any?
			
			event.works.each do |work|
				cats += work.categories if work.categories
			end
			
		end
		return cats
	end

end
