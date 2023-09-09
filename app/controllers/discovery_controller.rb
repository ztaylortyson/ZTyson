class DiscoveryController < ApplicationController
  
  def goto_discovery_folder
    Dir.chdir(Rails.root.join("discovery"))
  end

  def set_lawsuit
    @lawsuit = Lawsuit.find(params[:format])
  end

  def populate
    @doc.bookmarks['case_number'].insert_text_after(@lawsuit.case_number)
    @doc.bookmarks['atty_for'].insert_text_after(@lawsuit.atty_for)
    @doc.bookmarks['date_filed'].insert_text_after(@lawsuit.date_filed)
    #@doc.bookmarks['trial_date'].insert_text_after(@lawsuit.trial_date)
    @doc.bookmarks['plt_caption'].insert_text_after(@lawsuit.plt_caption)
    @doc.bookmarks['def_caption'].insert_text_after(@lawsuit.def_caption)
    @doc.bookmarks['judge_name'].insert_text_after(@lawsuit.judge_name)
    @doc.bookmarks['judge_dept'].insert_text_after(@lawsuit.judge_dept)
    @doc.bookmarks['plaintiff'].insert_text_after(@lawsuit.plaintiff)
    @doc.bookmarks['defendant'].insert_text_after(@lawsuit.defendant)


  end

  def download(foo)
    send_file "#{@lawsuit.atty_for}_#{foo}.docx", :disposition => 'attachment'
    puts "file downloaded!"
  end

  def srog
      foo = __method__
      set_lawsuit
      goto_discovery_folder
      @doc = Docx::Document.open("#{foo}.docx")
      populate
      @doc.save("#{@lawsuit.atty_for}_#{foo}.docx")
      download(foo)
  end

  def frog_e
  end

  def frog_g
  end

  def rfa
  end

  def rfp
      foo = __method__
      set_lawsuit
      goto_discovery_folder
      @doc = Docx::Document.open("#{foo}.docx")
      populate
      @doc.save("#{@lawsuit.atty_for}_#{foo}.docx")
      download(foo)
  end

  def depo_pmk
  end

  def depo_indiv
  end




end
