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


	def event_title(event)
				if event.works.any?
					event.works.first.name
				else
					event.artists.first.name + more_event_titles(event)
				end
	end

		

end
