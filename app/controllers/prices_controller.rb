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
			@section = @price.subcategory.category.section
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

	def show
		@price = Price.find(params[:id])
		@section = @price.subcategory.category.section
	end

	def update
		@price = Price.find(params[:id])
		if @price.update_attributes(price_params)
			@section = @price.subcategory.category.section
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
		@price = Price.find(params[:id])
		@price.destroy
		@section = @price.subcategory.category.section
		respond_to do |format|
			format.js
		end
	end

	def new_row
		@price = Price.find(params[:price_id])
		respond_to do |format|
			format.js
		end
	end

	def new_column
		@price = Price.find(params[:price_id])
		respond_to do |format|
			format.js
		end
	end

	def create_row
		unless params[:headers].nil?
			@price = Price.find(params[:price_id])
			params[:headers].each do |header, value|
        Row.create(header_id: header.to_i, value: value)
      end
      respond_to do |format|
      	format.js
      end
    end     
	end

	def create_column
		unless params[:header].nil?
			@price = Price.find(params[:price_id])
			header = Header.create(title: params[:header], price_id: params[:price_id].to_i)
			params[:rows].each_value { |value| Row.create(header_id: header.id, value: value) } unless params[:rows].nil?
      respond_to do |format|
      	format.js
      end
    end     
	end

	def edit_column
		@header = Header.find(params[:id])
		@price = Price.find(params[:price_id])
		respond_to do |format|
			format.js
		end
	end

	def update_column
		unless params[:header].nil?
			header = Header.find(params[:id]).update_attributes(title: params[:title])
			@price = Price.find(params[:price_id])
			params[:rows].each do |value, id| 
				header.rows.find(id).update_attributes(value: value)
			end
      respond_to do |format|
      	format.js
      end
    end   
	end

	def destroy_column
		Header.find(params[:id]).destroy
		@price = Price.find(params[:price_id])
		respond_to :js
	end

	def destroy_row
	end

	private

  def price_params
      params.require(:price).permit(:title, :description, :subcategory_id, :image, headers_attributes: [:id,:title,:_destroy])
  end
end
