class CreateMembership < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id, default: false
      t.integer :subreddit_id
      t.boolean :moderator
    end
  end
end
