class Header < ActiveRecord::Base
	validates :title,  presence: true

	belongs_to :price
	has_many :rows, dependent: :destroy
end
