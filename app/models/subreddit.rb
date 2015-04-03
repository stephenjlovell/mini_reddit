class Subreddit < ActiveRecord::Base
  has_many :posts

  has_many :memberships
  has_many :users, through: :memberships

  def moderators
    users.merge(Membership.moderators)
  end

end
