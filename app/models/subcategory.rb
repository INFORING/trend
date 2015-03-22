class Subcategory < ActiveRecord::Base
	validates :title,  presence: true

	has_many :prices
	belongs_to :category
end
