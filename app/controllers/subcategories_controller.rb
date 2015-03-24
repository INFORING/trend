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
			@categories = Category.all
			respond_to do |format|
				format.js
			end
		end
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
			@categories = Category.all
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
		@subcategory = Subcategory.find(params[:id])
		@subcategory.destroy
	end

	private

  def subcategory_params
      params.require(:subcategory).permit(:title, :image, :category_id)
  end
end
