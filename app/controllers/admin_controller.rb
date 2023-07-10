class AdminController < ApplicationController
  
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
      redirect_to admin_index_path


  end




end
