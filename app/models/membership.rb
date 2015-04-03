class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit

  scope :moderators, -> { where(moderator: true) }

end