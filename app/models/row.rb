class Row < ActiveRecord::Base
	before_create :add_row_count

	validates :value,  presence: true

	belongs_to :header

	private

	def add_row_count
		self.row_count = self.header.rows.count + 1
	end

end
