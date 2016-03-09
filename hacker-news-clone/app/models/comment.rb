class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comment_votes

  validates_presence_of :content
end
