class AddDefaultValueToVotesAttribute < ActiveRecord::Migration
  def up
    change_column :posts, :votes, :integer, default: 0
  end
  def down
    change_column :posts, :votes, :integer, default: nil
  end
end
