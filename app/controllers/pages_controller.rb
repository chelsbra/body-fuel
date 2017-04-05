class PagesController < ApplicationController
	def show
		@page = Page.find_by(:title => params[:page])	
	end
	# def contact
	# 	@page = Page.where("name IS " + params[:page])	
	# 	= render partial: "/#{params[:page]}", collection: @page
	# end
	# def about
	# 	= render partial: "/#{params[:page]}", collection: @page
	# end
end
