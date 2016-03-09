class EditColumnFromNamesToName < ActiveRecord::Migration
  def change
    rename_column :tags, :names, :name
  end
end
