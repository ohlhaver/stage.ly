#!/bin/env ruby
# encoding: utf-8

module ApplicationHelper

	def full_slogan(page_title)
	    base_title = "Alle Veranstaltungen in Lübeck"
	    if page_title.empty?
	      base_title
	    else
	      "#{page_title}"
	    end
 	end

 	def categories
 		categories = Category.all.sort_by &:name
 	end

 	def types
 		types = Type.all.sort_by &:name
 	end
end
