class AdminController < ApplicationController

  before_action :authenticate_user!
  
  include AdminHelper
  include BlahHelper

  def index
  
  end


  def search
      @cyear = params[:cyear]
      @cnumber = params[:cnumber]

      get_cns_page
      enter_case_info(@cyear, @cnumber)
      get_page(@cyear, @cnumber)
      puts " - - - - - - ->    Scraping successful"
      redirect_to admin_index_path
  end

  def stored_lawsuits
  end


end
