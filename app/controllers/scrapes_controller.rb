class ScrapesController < ApplicationController


	def index
		Dir.chdir(Rails.root.join("app", "views", "scrapes"))
		@roas = Dir.glob('*.erb') 
	end

	def view
		count = params[:format].to_i
		Dir.chdir(Rails.root.join("app", "views", "scrapes"))
		roas = Dir.glob('*.erb')
		file = roas[count].split('.')[0]
		render file
	end

	


end
