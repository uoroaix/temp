class Product < ActiveRecord::Base

	# validates :name, presence: true, uniqueness: true, exclusion: { in: %w(Apple Sony Microsoft), message: "%{value} is reserved!"}

	validates :name, presence: true, uniqueness: true, case_insensitive: false
	validates :price, presence: true, case_insensitive: false

	before_validation :add_sale_price, on: :create
	# validates :sale_price, numerically: :less_than :price
	before_validation :check_sale_price, on: :create

	before_destroy :log_info

	private

	def add_sale_price
		self.sale_price = self.sale_price || self.price
	end

	def check_sale_price
		if self.sale_price > self.price
			errors.add(:sale_price, "Sale price can't be higher than price")
		end
	end

	def log_info
		Rails.logger.info "Product is about to be deleted"
	end

end
