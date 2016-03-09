class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :vote_count, :default => 0
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps null: false
    end
  end
end
