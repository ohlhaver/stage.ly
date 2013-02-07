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
				elsif event.artists.any?
					event.artists.first.name + more_event_titles(event)
				else
					event.type.singular
				end
	end

	def german_month(month)
		if month == "1"
			return "Januar"
		elsif month == "2"
			return "Februar"
		elsif month == "3"
			return "Maerz"
		elsif month == "4"
			return "April"
		elsif month == "5"
			return "Mai"
		elsif month == "6"
			return "Juni"
		elsif month == "7"
			return "Juli"
		elsif month == "8"
			return "August"
		elsif month == "9"
			return "September"
		elsif month == "10"
			return "Oktober"
		elsif month == "11"
			return "November"
		elsif month == "12"
			return "Dezember"
		end
	end

	def german_weekday(day)
		if day == "0"
			return "Sonntag"
		elsif day == "1"
			return "Montag"
		elsif day == "2"
			return "Dienstag"
		elsif day == "3"
			return "Mittwoch"
		elsif day == "4"
			return "Donnerstag"
		elsif day == "5"
			return "Freitag"
		elsif day == "6"
			return "Samstag"
		end
	end
		

end
