class PagesController < ApplicationController
	def show
		@page = Page.all	
	end
end
