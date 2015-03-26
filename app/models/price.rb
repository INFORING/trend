class Price < ActiveRecord::Base
	validates :title,  presence: true
	validates :description,  presence: true

	belongs_to :subcategory
	has_many :headers, dependent: :destroy

	accepts_nested_attributes_for :headers, :allow_destroy => true 

	has_attached_file :image, :styles => { :large => "600x600!", :medium => "300x300!", :thumb => "100x100!" }, :default_url => "logo.png"
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }

	def rows_count
		self.headers.any? ? self.headers.first.rows.count : 0
	end
end
