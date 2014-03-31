class Question < ActiveRecord::Base

	

	# validates_presence_of :title, presence: {message: "title can't be blank!!"}
	validates :title, presence: true, uniqueness: true
	#this validates if there are presence and it has to be unique
	validates_presence_of :description, message: "must be present"

	default_scope order("created_at DESC")

	scope :recent_ten, -> {order("created_at DESC").limit(10)}
	scope :recent_ten, lambda {order("created_at DESC").limit(10)}
	scope :created_after, lambda { |x| where(:created_at => (x)..(0.days.ago))}

	def self.recent_ten
		order("created_at DESC").limit(10)
	end

	# default_scope order("title ASC")


end
