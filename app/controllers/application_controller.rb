class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :event_work_categories, :event_categories

  	def category_events(category)
		return category.events + category.events_from_artists + category.events_from_works
	end

	def event_categories(event)
		return event.categories + event.categories_from_works + event.categories_from_artists
	end

end
