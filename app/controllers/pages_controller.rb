class PagesController < ApplicationController

  before_action :authenticate_user!

  include PagesHelper

  def home
    PagesHelper::foo
  end
end
