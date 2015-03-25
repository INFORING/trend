class Category < ActiveRecord::Base
	validates :title,  presence: true

	has_many :subcategories
	belongs_to :section

	has_attached_file :image, :styles => { :large => "600x600!", :medium => "300x300!", :thumb => "100x100!" }, :default_url => "logo.png"
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
end
