class CreateEntryTags < ActiveRecord::Migration
  def change
    create_table :entry_tags do |t|
      t.belongs_to :entry, index: true
      t.belongs_to :tag, index: true
    end
  end
end
