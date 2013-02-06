#!/bin/env ruby
# encoding: utf-8

module ApplicationHelper

	def full_slogan(page_title)
	    base_title = "Alle Konzerte in Lübeck"
	    if page_title.empty?
	      base_title
	    else
	      "#{page_title}"
	    end
 	end

 	def categories
 		@type = Type.find(1)
 		categories = @type.categories.sort_by(&:name)
 		
 	end

 	def types
 		types = Type.all.sort_by &:name
 	end
end
