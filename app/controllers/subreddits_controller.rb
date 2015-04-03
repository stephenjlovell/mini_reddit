class SubredditsController < ApplicationController
  before_action :set_subreddit, except: :index
  before_action :authenticate_user!, except: [:show, :index]

  def subscribe
    # @subreddit.memberships.build()
  end

  def unsubscribe
    membership = @subreddit.memberships.where(user_id: current_user.id)
    if membership
      membership.destroy 
    end
  end

  def show
    @posts = @subreddit.posts
    @admins = @subreddit.moderators
  end

  def index

  end

private

  def set_subreddit
    @subreddit = Subreddit.find(params[:id])
  end
end