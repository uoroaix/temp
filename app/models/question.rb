class Question < ActiveRecord::Base

	has_attached_file :image,
	:styles => { :medium => "300x300>", :thumb => "100x100>" },
	:default_url => ActionController::Base.helpers.asset_path("missing_:style.png")
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

 	# mount_uploader :image, ImageUploader

	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user

	has_many :answers, dependent: :destroy
	has_many :comments, through: :answers
	has_one :question_detail, dependent: :destroy
	belongs_to :user
	has_many :votes, dependent: :destroy
	has_many :voted_users, through: :votes, source: :user

	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	# validates_presence_of :title, presence: {message: "title can't be blank!!"}
	validates :title, presence: true, uniqueness: true
	#this validates if there are presence and it has to be unique
	validates_presence_of :description, message: "must be present"

	default_scope {order("created_at DESC")}

	scope :recent_ten, -> {order("created_at DESC").limit(10)}
	scope :recent_ten, lambda {order("created_at DESC").limit(10)}
	scope :created_after, lambda { |x| where(:created_at => (x)..(0.days.ago))}
	scope :recent, lambda {|x| order("created_at DESC").limit(x)}

	def self.recent_ten
		order("created_at DESC").limit(10)
	end


	
	# default_scope order("title ASC")


end
