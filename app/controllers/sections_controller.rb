class SectionsController < ApplicationController
	def new
		@section = Section.new
		respond_to :js
	end

	def create
		if Section.create(section_params)
			@section = Section.all
			respond_to :js
		end
	end

	def show
		@section = Section.find(params[:id])
	end

	def edit
		@section = Section.find(params[:id])
    respond_to :js
	end

	def update
		if Section.find(params[:id]).update_attributes(section_params)
			@section = Section.all
    	respond_to :js
		end
	end

	def destroy
		Section.find(params[:id]).destroy
		@section = Section.all
		respond_to :js
	end

	private

  def section_params
      params.require(:section).permit(:title)
  end
end
