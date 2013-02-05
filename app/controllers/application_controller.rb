class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :event_work_categories, :event_categories, :event_composers, :event_works_events

  	def category_events(category)
		return category.events + category.events_from_artists + category.events_from_works
	end

	def event_categories(event)
		return event.categories + event.categories_from_works + event.categories_from_artists
	end

	def event_composers(event)
		return event.composers + event.direct_composers
	end

	def event_works_events(event)
		return event.works_events - Array.wrap(event)
	end


end
