module EventsHelper
	def more_event_titles(event)
		if event.artists.drop(1).any?
		render :partial => 'artists/event_artist', :collection => event.artists.drop(1) 
		else
		""
		end	
	end

	def more_linked_event_titles(event)
		if event.artists.drop(1).any?
		render :partial => 'artists/linked_event_artist', :collection => event.artists.drop(1) 
		else
		""
		end	
	end

	def work_categories(event)
		if event.works.any?
			cats=[]
			event.works.each do |work|
				cats += Array.wrap(work.category) if work.category
			end
			return cats
		end
	end

		

end
