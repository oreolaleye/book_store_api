class Book < ApplicationRecord

  scope :active, -> { where(deleted_at: nil) }
	scope :deleted, -> { where.not(deleted_at: nil) }
	scope :discounted_books, -> { where.not(discount: nil) }

	validates :title, presence: true, length: { maximum: 255 }
	validates :body, allow_nil: true, length: { maximum: 2000 }
	validates :cost_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0  }
	validates :discount, allow_nil: true, numericality: { less_than: 1 }
	
	def cost 
		cost_cents/100.0
	end

	def price
		price_cents/100.0
	end
end
