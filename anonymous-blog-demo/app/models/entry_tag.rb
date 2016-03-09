class EntryTag < ActiveRecord::Base
  belongs_to :entry
  belongs_to :tag

  validates_associated :entry, :tag
end
