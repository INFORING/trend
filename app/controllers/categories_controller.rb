class CategoriesController < ApplicationController
	before_action :admin_user, except: [:show]

	def new
		@category = Category.new
		@section = Section.find(params[:section_id])
		respond_to :js
	end

	def create
		@section = Section.find(params[:section_id])
		if @section.categories.create(category_params)
			@categories = Category.all
			respond_to :js
		end
	end

	def show
		@category = Category.find(params[:id])
		@section = Section.find(params[:section_id])
	end

	def edit
		@category = Category.find(params[:id])
		@section = Section.find(params[:section_id])
		respond_to :js
	end

	def update
		if Category.find(params[:id]).update_attributes(category_params)
			@categories = Category.all
			respond_to :js
		end
	end

	def destroy
		@category = Category.find(params[:id]).destroy
		@section = @category.section
		respond_to :js
	end

	private

  def category_params
      params.require(:category).permit(:title, :image)
  end
end
