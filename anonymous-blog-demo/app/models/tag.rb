class Tag < ActiveRecord::Base
  has_many :entry_tags
  has_many :entries, through: :entry_tags

  validates_presence_of :name
  # validates_associated :entry_tags, :entries
end
