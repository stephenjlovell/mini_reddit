class AddDescriptionToSubreddits < ActiveRecord::Migration
  def change
    add_column :subreddits, :description, :string
  end
end
