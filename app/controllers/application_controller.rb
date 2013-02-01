class ApplicationController < ActionController::Base
  protect_from_forgery

  	def category_events(category)
		cats =[]
		category.works.each do |work|
			cats += work.events 
		end
		cats += category.events
	end
end
