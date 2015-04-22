class ApplicationController < ActionController::Base
	include ApplicationHelper

  protect_from_forgery with: :exception

  before_filter :get_sections

  def get_sections
    @sections = Section.all
	end

end
