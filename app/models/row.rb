class Row < ActiveRecord::Base
	validates :value,  presence: true

	belongs_to :header
end
