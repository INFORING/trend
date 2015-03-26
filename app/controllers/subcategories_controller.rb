class SubcategoriesController < ApplicationController
	def new
		@subcategory = Subcategory.new
		@id = params[:category_id].to_i
		respond_to do |format|
			format.js
		end
	end

	def create
		@subcategory = Subcategory.new(subcategory_params)
		if @subcategory.save
			@section = @subcategory.category.section
			respond_to do |format|
				format.js
			end
		end
	end

	def show
		@subcategory = Subcategory.find(params[:id])
		@section = @subcategory.category.section
	end

	def edit
		@subcategory = Subcategory.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@subcategory = Subcategory.find(params[:id])
		if @subcategory.update_attributes(subcategory_params)
			@section = @subcategory.category.section
			respond_to do |format|
				format.js
			end
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
