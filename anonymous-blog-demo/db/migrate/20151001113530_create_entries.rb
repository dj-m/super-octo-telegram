class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title, null:false
      t.string :content, null:false
      t.belongs_to :user

      t.timestamps null:false
    end
  end
end
