class Section < ActiveRecord::Base
	validates :title,  presence: true

	has_many :categories, dependent: :destroy
end
