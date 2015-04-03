class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit
  has_many :comments

end
