class Entry < ActiveRecord::Base
  has_many :entry_tags
  has_many :tags, through: :entry_tags
  belongs_to :user

  validates :title, :content, presence: true
  validates_associated :user
end
