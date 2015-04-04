class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  has_many :memberships
  has_many :subreddits, through: :memberships, 
                        after_add: ->(u, s) { m = s.memberships.first.moderator = true; m.save }

  def subscribed?(subreddit)
    self.memberships.exists?(subreddit_id: subreddit.id)
  end

end
