class PagesController < ApplicationController

  before_action :authenticate_user!

  include PagesHelper

  def home
      if calnamesearch.include?('Sorry')
        @blah = "No matches found."
      else
        @blah = calnamesearch
      end
  end
end
