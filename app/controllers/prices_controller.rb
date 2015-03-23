class PricesController < ApplicationController
	def new
		@price = Price.new
		@id = params[:subcategory_id].to_i
		respond_to do |format|
			format.js
		end
	end

	def create
		@price = Price.new(price_params)
		if @price.save
			@categories = Category.all
			respond_to do |format|
				format.js
			end
		end
	end

	def edit
		@price = Price.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def update
		@price = Price.find(params[:id])
		if @price.update_attributes(price_params)
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
		@price = Price.find(params[:id])
		@price.destroy
		respond_to do |format|
			format.js
		end
	end

	private

  def price_params
      params.require(:price).permit(:title, :description, :subcategory_id, :image)
  end
end
