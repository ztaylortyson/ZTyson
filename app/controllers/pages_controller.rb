class PagesController < ApplicationController

  before_action :authenticate_user!

  include PagesHelper
  

  def home
        if calnamesearch.include?('Sorry')
          @blah = "No matches found."
        else
            puts "Case count: #{calnamesearch.split(/\d{2}\/\d{2}\/\d{2}/).count}"
            # North County || Central || 
            # 
            @loc = calnamesearch.split(/\d{2}\/\d{2}\/\d{2}/).first.split('-------------------------').last().to_s
            @blah = calnamesearch.split(/\d{2}\/\d{2}\/\d{2}/)
        end

      enigma
      trialsoncal
      
  end

  def case_info
    Dir.chdir(Rails.root.join("app", "views", "pages"))
    file = "case_info.html.erb"
    render file
    #greeting
  end

  

  def clt
      @client = Client.find(params[:format])
  end

  def ul
    @user = current_user
    @ul = current_user.lawsuits
  end

#####################################
# Client - create envelope
  def goto_correspondence_folder
      Dir.chdir(Rails.root.join("correspondence"))
  end
  def download
    send_file "#{@client.lname}-envelope.docx", :disposition => 'attachment'
    puts "file downloaded!"
  end
  def cltenvelope
      @client = Client.find(params[:format])
      goto_correspondence_folder
      @doc = Docx::Document.open('envelope.docx')
      populate_envelope
      @doc.save("#{@client.lname}-envelope.docx")
      download
  end
  def populate_envelope
      @doc.bookmarks['name'].insert_text_after("#{@client.fname} #{@client.lname}")
      @doc.bookmarks['address'].insert_text_after(@client.address)
      @doc.bookmarks['city'].insert_text_after(@client.city)
      @doc.bookmarks['state'].insert_text_after(@client.state)
      @doc.bookmarks['zip'].insert_text_after(@client.zip)
  end
#####################################
# Attorney - create Letter
  def attycorres
      @atty = Attorney.find(params[:format])
      goto_correspondence_folder
       @doc = Docx::Document.open("#{params[:action]}.docx")
       populate_atty
       @doc.save("#{@atty.name}-#{params[:action]}.docx")
      dload
  end

#####################################
# Attorney - create envelope
  def attyenvelope 
      @atty = Attorney.find(params[:format])
      goto_correspondence_folder
      @doc = Docx::Document.open('attyenvelope.docx')
      populate_atty
      @doc.save("#{@atty.name}-#{params[:action]}.docx")
      dload
  end
  def  populate_atty
      @doc.bookmarks['name'].insert_text_after(@atty.name)
      @doc.bookmarks['firm'].insert_text_after(@atty.firm)
      @doc.bookmarks['address'].insert_text_after(@atty.address)
      @doc.bookmarks['city'].insert_text_after(@atty.city)
      @doc.bookmarks['state'].insert_text_after(@atty.state)
      @doc.bookmarks['zip'].insert_text_after(@atty.zip)
  end
  def dload
      send_file "#{@atty.name}-#{params[:action]}.docx", :disposition => 'attachment'
  end

end
