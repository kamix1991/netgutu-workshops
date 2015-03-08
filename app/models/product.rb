class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, :description, :price, presence: true
  validates :price, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than: 0 }

	def average_rating
		reviews.any? ? reviews.pluck(:rating).sum.to_f / reviews.count : 0
	end

end
