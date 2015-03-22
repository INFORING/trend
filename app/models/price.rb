class Price < ActiveRecord::Base
	validates :title,  presence: true
	validates :description,  presence: true

	belongs_to :subcategory
end
