class Topic < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 500 }
  belongs_to :user
  has_many :comments, dependent: :destroy
end
