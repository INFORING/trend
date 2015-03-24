class CategoriesController < ApplicationController
	def new
		@category = Category.new
		respond_to do |format|
			format.js
		end
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			@categories = Category.all
			respond_to do |format|
				format.js
			end
		end
	end

	def edit
		@category = Category.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(category_params)
			@categories = Category.all
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
	end

	private

  def category_params
      params.require(:category).permit(:title, :image)
  end
end
