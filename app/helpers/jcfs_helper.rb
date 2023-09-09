module JcfsHelper

	def goto_jcfs_folder
		Dir.chdir(Rails.root.join("jcfs"))
	end

	def set_models
		@attorney = current_user
		@lawsuit = Lawsuit.find(params[:format])
	end

	def generate_pdftk
		@pdftk = PdfForms.new('/usr/local/bin/pdftk')
	end






end
