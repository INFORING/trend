class SubcategoriesController < ApplicationController
	before_action :admin_user, except: [:show]
	
	def new
		@subcategory = Subcategory.new
		@id = params[:category_id].to_i
		respond_to :js
	end

	def create
		@subcategory = Subcategory.new(subcategory_params)
		if @subcategory.save
			@section = @subcategory.category.section
			respond_to :js
		end
	end

	def show
		@subcategory = Subcategory.find(params[:id])
		@section = @subcategory.category.section
	end

	def edit
		@subcategory = Subcategory.find(params[:id])
		respond_to :js
	end

	def update
		@subcategory = Subcategory.find(params[:id])
		if @subcategory.update_attributes(subcategory_params)
			@section = @subcategory.category.section
			respond_to :js
		end
	end

	def destroy
		@subcategory = Subcategory.find(params[:id])
		@section = @subcategory.category.section
		@subcategory.destroy
		respond_to :js
	end

	private

  def subcategory_params
      params.require(:subcategory).permit(:title, :image, :category_id)
  end
end
