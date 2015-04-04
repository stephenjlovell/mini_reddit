class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit
  has_many :comments

  scope :top, ->{ order(votes: :desc) }
  scope :hot, ->{ order(comments_count: :desc) }

end
