class CreateComments < ActiveRecord::Migration
  def change
    create_table :commments do |t| #omfg wow really
      t.string :content, null: false
      t.belongs_to :post
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
