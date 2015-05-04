class PricesController < ApplicationController
	before_action :admin_user, except: [:show]
	after_action :refresh_row_counts, only: [:destroy_row]

	def new
		@price = Price.new
		@id = params[:subcategory_id].to_i
		respond_to :js
	end

	def create
		@price = Price.new(price_params)
		if @price.save
			@section = @price.category.section
			respond_to :js
		end
	end

	def edit
		@price = Price.find(params[:id])
		respond_to :js
	end

	def show
		@price = Price.find(params[:id])
		@section = @price.category.section
	end

	def update
		@price = Price.find(params[:id])
		if @price.update_attributes(price_params)
			@section = @price.category.section
			respond_to :js
		end
	end

	def destroy
		@price = Price.find(params[:id])
		@price.destroy
		@section = @price.category.section
		respond_to :js
	end

	def new_row
		@price = Price.find(params[:price_id])
		respond_to :js
	end

	def new_column
		@price = Price.find(params[:price_id])
		respond_to :js
	end

	def create_row
		unless params[:headers].nil?
			@price = Price.find(params[:price_id])
			params[:headers].each do |header_id, value|
        Row.create(header_id: header_id.to_i, value: value)
      end
      respond_to :js
    end     
	end

	def create_column
		unless params[:header].nil?
			@price = Price.find(params[:price_id])
			header = Header.create(title: params[:header], price_id: params[:price_id].to_i)
			params[:rows].each { |count,value| Row.create(header_id: header.id, value: value) } unless params[:rows].nil?
      respond_to :js
    end     
	end

	def edit_column
		@header = Header.find(params[:id])
		@price = Price.find(params[:price_id])
		respond_to :js
	end

	def update_column
		unless params[:title].nil?
			header = Header.find(params[:id])
			header.update_attributes(title: params[:title])
			@price = Price.find(params[:price_id])
			unless params[:rows].nil?
				params[:rows].each do |id, value| 
					header.rows.find(id).update_attributes(value: value)
				end
			end
      respond_to :js
    end   
	end

	def destroy_column
		Header.find(params[:id]).destroy
		@price = Price.find(params[:price_id])
		respond_to :js
	end

	def destroy_row
		@price = Price.find(params[:price_id])
		@price.rows.where(row_count: params[:count]).each { |row| row.destroy }
		respond_to :js
	end

	private

  def price_params
    params.require(:price).permit(:title, :description, :category_id, :image, headers_attributes: [:id,:title,:_destroy])
  end

  def refresh_row_counts
  	price = Price.find(params[:price_id])
  	price.rows.where("row_count > ?", params[:count].to_i).each do |row|
  		row.update_attributes(row_count: row.row_count - 1)
  	end
  end

end
