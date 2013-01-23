module ApplicationHelper

	def full_slogan(page_title)
	    base_title = "Konzerte in Berlin"
	    if page_title.empty?
	      base_title
	    else
	      "#{page_title}"
	    end
 	end

 	def categories
 		categories = Category.all.sort_by &:name
 	end
end
