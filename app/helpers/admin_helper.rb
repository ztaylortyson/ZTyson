module AdminHelper

	def get_captcha
		word_list = [
                # Screenshot name end in 0, house_words
                ['house', 'residence', 'home'],
                # Screenshot name end in 1, clock_words
                ['clock', 'timepiece', 'watch'],
                # Screenshot name end in 2, key_words
                ['padlock', 'lock', 'key'],
                # Screenshot name end in 3, flag_words
                ['banner', 'flag', 'pennant'],
                # Screenshot name end in 4, bug_words
                ['bug', 'beetle', 'insect'],
                # Screenshot name end in 5, bulb_words
                ['bulb', 'light', 'light bulb'],
                # Screenshot name end in 6, pen_words
                ['pen', 'pencil', 'ballpoint', 'ink'],
                # Screenshot name end in 7, heart_words
                ['valentine', 'heart', 'love'],
                # Screenshot name end in 8, music_words
                ['notes', 'music', 'tune'],
                # Screenshot name end in 9, world_words
                ['world', 'globe', 'earth']]
	end


	def click_accept_terms
			@counter = 0
			@btn_arry = []
			url = "https://roa.sdcourt.ca.gov/roa/"
			@driver = Selenium::WebDriver.for :safari
			@driver.get(url)
			sleep 1

			btn_accept_terms = @driver.find_element(:xpath, "//*[@id='j_idt36']/a[1]")
			@driver.execute_script("arguments[0].click();", btn_accept_terms)
			sleep 2
			@foo = @driver.current_url 
		end
	# get icon that best identifies . . 
		def get_icon
			doc = Nokogiri::HTML(@driver.page_source)
			icon_word = doc.css('span.bold-type').text
			puts icon_word.inspect
			sleep 1
			return icon_word
		end
	# find best icon 
		def find_best_icon(get_icon)
			get_captcha.each do |i|
					if i[0] == get_icon
						return get_captcha.index(i)
					elsif i[1] == get_icon
						return get_captcha.index(i)
					elsif i[2] == get_icon
						return get_captcha.index(i)
					elsif i[3] == get_icon
						return get_captcha.index(i)
					end
			end
		end

		def get_src_png
			puts "looking for src png"
			src = Nokogiri::HTML(@driver.page_source)
			src.xpath("//input[@type='image']").each do |i|
				icon_png = i.values[2]
				position = icon_png.index('.')
				@btn_arry << btn_png = icon_png[position - 1].to_i
			end
		end

		def get_btn(w, z)
			p w.inspect
			p z.inspect
			return w.find_index(z) + 1
		end

	######################################
	# click the correct captcha icon
		def click_captcha_icon(x)
			puts "//input[@id='j_idt12:button#{x}']"
			click_icon = @driver.find_element(:xpath, "//input[@id='j_idt12:button#{x}']")
			@driver.execute_script("arguments[0].click();", click_icon)
			sleep 1		
			@foo = @driver.current_url		
			sleep 2
		end
	############################################################
	############################################################
	# get to ROA cns page
		def get_cns_page
			click_accept_terms
			@num = find_best_icon(get_icon).to_i
			get_src_png
			foo = get_btn(@btn_arry,@num)
			click_captcha_icon(foo.to_s)
		end
	#############################################################
		def enter_case_info(case_year, case_number)
				# year
				cyear = @driver.find_element(:name, "j_idt32:caseyear")
				choose = Selenium::WebDriver::Support::Select.new(cyear)
				choose.select_by(:text, case_year)
				
				sleep 1
				# case number
				cnumber = @driver.find_element(:xpath, "//input[@id='j_idt32:casenumber']").send_keys case_number
				
				sleep 1
				# click btn
				btn = @driver.find_element(:xpath, "//input[@name='j_idt32:j_idt56']")
				@driver.execute_script("arguments[0].click();", btn)
				sleep 2
				 
		end


			def get_page(case_year, case_number)
				sleep 1
				puts @driver.current_url 
				doc = Nokogiri::HTML(@driver.page_source)

				Dir.chdir(Rails.root.join("storage"))
				open("#{case_year}-#{case_number}.html", 'a+') do |i|
					
					i << doc
				end
				@driver.quit
			end


end









