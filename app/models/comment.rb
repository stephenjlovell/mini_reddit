class Comment < ActiveRecord::Base
  has_one :user
  has_one :post
  has_many :responses, class_name: 'Post', foreign_key: 'parent_id'
end
