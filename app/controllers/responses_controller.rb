class ResponsesController < ApplicationController

	def goto_responses_folder
		Dir.chdir(Rails.root.join("responses"))
	end

	def set_lawsuit
		@lawsuit = Lawsuit.find(params[:format])
	end

	def populate
		@doc.bookmarks['case_number'].insert_text_after(@lawsuit.case_number)
		@doc.bookmarks['case_title'].insert_text_after(@lawsuit.case_title)
		@doc.bookmarks['atty_for'].insert_text_after(@lawsuit.atty_for)
	end

	def download(foo)
		#goto_genesis_folder
		send_file "#{@lawsuit.atty_for}_#{foo}.docx", :disposition => 'attachment'
		puts "file downloaded!"
	end

	def verification
		foo = __method__
		set_lawsuit
		goto_responses_folder
		@doc = Docx::Document.open('verification.docx')
		populate
		@doc.save("#{@lawsuit.atty_for}_#{foo}.docx")
		download(foo)
	end







end
