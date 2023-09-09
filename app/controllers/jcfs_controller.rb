class JcfsController < ApplicationController

	include JcfsHelper

	def dismissal
		#CIV-110 Request for Dismissal.pdf 
		launch
	end

	def frog_general
		launch
	end

	def frog_employment
		launch
	end

	def cms
		launch
	end

	def rfa
		launch
	end

	def pes
		launch
	end

	def ex_parte
		launch
	end

	def populate
		@pdftk.fill_form "./#{params[:action]}.pdf", "#{@lawsuit.atty_for}_#{params[:action]}.pdf",
		{
			:atty_name 	=> @attorney.full_name,
			:sbn 		=> @attorney.sbn,
			:atty_firm  => @attorney.firm,
			:atty_address => @attorney.address,
			:atty_city  => @attorney.city,
			:atty_state => @attorney.state,
			:atty_zip	=> @attorney.zip,
			:atty_telephone => @attorney.phone,
			:atty_email	=> @attorney.email,

			:case_number => @lawsuit.case_number,
			:atty_for 	=> @lawsuit.atty_for,

			#:cmc_date	=> @lawsuit.cmc.strftime("%m/%d/%Y"),
		
			:plaintiff	=> @lawsuit.plaintiff,
			:defendant 	=> @lawsuit.defendant,
			:judge_name => @lawsuit.judge_name,
			:judge_dept => @lawsuit.judge_dept,
			:date_complaint_filed => @lawsuit.date_filed,  #.strftime("%m/%d/%Y"),

			:short_title  	 => "#{@lawsuit.plaintiff} v. #{@lawsuit.defendant}",
			:asking_party 	 => @lawsuit.plaintiff,  #.upcase,
			:answering_party => @lawsuit.defendant,  #.upcase,
			:set_number		 => "ONE",

			:ct_county => "SAN DIEGO",
		    :ct_street_address => "Hall of Justice", 
		    :ct_mailing_address => "330 West Broadway",
		    :ct_city_zip => "San Diego, 92101",
		    :ct_branch => "Central Division",

		    :unlimited_civil => 0
		}
	end

	def download
		    send_file "#{@lawsuit.atty_for}_#{params[:action]}.pdf", :disposition => 'attachment'
		    puts "file downloaded!"
  	end

  	def launch
  		set_models
		generate_pdftk
		goto_jcfs_folder
		populate
		download
  	end


end
