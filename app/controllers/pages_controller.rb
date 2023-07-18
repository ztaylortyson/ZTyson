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


  end

  def clt
      @client = Client.find(params[:format])
  end



end
