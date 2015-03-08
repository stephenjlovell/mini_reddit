class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  
  # has_many :responses, class_name: 'Post', foreign_key: 'parent_id'
  # acts_as_tree order: 'votes DESC'
  acts_as_tree order: 'created_at DESC'
end
