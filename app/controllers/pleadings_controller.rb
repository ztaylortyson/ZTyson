class PleadingsController < ApplicationController

	def goto_genesis_folder
		Dir.chdir(Rails.root.join("genesis"))
	end

	def goto_pleadings_folder
		Dir.chdir(Rails.root.join("pleadings"))
	end

	def goto_jc_forms_folder
		Dir.chdir(Rails.root.join("app", "jc_forms"))
	end

	def goto_correspondence_folder
		Dir.chdir(Rails.root.join("app", "correspondence"))
	end

	def set_lawsuit
		@lawsuit = Lawsuit.find(params[:format])
	end

	def download
		#goto_genesis_folder
		send_file "#{@lawsuit.atty_for}.docx", :disposition => 'attachment'
		puts "file downloaded!"
	end
	def remove_file
		File.delete("#{@lawsuit.atty_for}.docx") if File.exist?("#{@lawsuit.atty_for}.docx")
	end

	def generic
		set_lawsuit
		goto_pleadings_folder
		@doc = Docx::Document.open('arial.docx')
		populate_generic_pleading
		#goto_genesis_folder
		@doc.save("#{@lawsuit.atty_for}.docx")
		download
	end

	def populate_generic_pleading
		@doc.bookmarks['caption_title'].insert_text_after("   MyCaption")
		@doc.bookmarks['atty_for'].insert_text_after(@lawsuit.plt_caption)
	    @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
	    @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)
	    @doc.bookmarks['case_number'].insert_text_after(@lawsuit.case_number)
	    @doc.bookmarks['judge_name'].insert_text_after(@lawsuit.judge_name)
	    @doc.bookmarks['judge_dept'].insert_text_after(@lawsuit.judge_dept)

	    puts " = = =       =     =    =  = = = = =   = ==  = =   = =    ==  = = == == ="
	    #puts @lawsuit.date_filed.strftime("%m/%d/%Y")
	    @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.date_filed.strftime("%m/%d/%Y"))
	     @doc.bookmarks['trial_date'].insert_text_after(@lawsuit.trial.strftime("%m/%d/%Y"))
	end

	def supp_interrogatories
		set_lawsuit
		goto_pleadings_folder
		@doc = Docx::Document.open('supp_interrogatories.docx')
		populate_supp_interrogatories
		@doc.save("#{@lawsuit.atty_for}_supp_rogs.docx")
		send_file "#{@lawsuit.atty_for}_supp_rogs.docx", :disposition => 'attachment'
		puts "file downloaded!"
	end

	def decl_atty
		set_lawsuit
		goto_pleadings_folder
		@doc = Docx::Document.open('decl_atty.docx')
		populate_generic_pleading
		@doc.save("#{@lawsuit.atty_for}_atty_decl.docx")
		send_file "#{@lawsuit.atty_for}_atty_decl.docx", :disposition => 'attachment'
		puts "file downloaded!"
	end

	def populate_supp_interrogatories
		@doc.bookmarks['atty_for'].insert_text_after(@lawsuit.plt_caption)
	    @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
	    @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)
	    @doc.bookmarks['case_number'].insert_text_after(@lawsuit.case_number)
	    @doc.bookmarks['judge_name'].insert_text_after(@lawsuit.judge_name)
	    @doc.bookmarks['judge_dept'].insert_text_after(@lawsuit.judge_dept)
	    @doc.bookmarks['defendant'].insert_text_after(@lawsuit.defendant)
	    @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.date_filed.strftime("%m/%d/%Y"))
	    @doc.bookmarks['trial_date'].insert_text_after(@lawsuit.trial.strftime("%m/%d/%Y"))
	end


end

