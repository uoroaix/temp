class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :body, presence: :true

  before_save :capitalize_body

  scope :ordered_by_creation, -> { order("created_at DESC")}

  private

  def capitalize_body
    self.body.capitalize!
  end
end
