class SubredditsController < ApplicationController
  before_action :set_subreddit, only: [:show, :subscribe, :unsubscribe]
  before_action :authenticate_user!, except: [:show, :index]

  def subscribe
    current_user.memberships.where(subreddit_id: @subreddit.id).first_or_create
    redirect_to @subreddit, notice: "You're now subscribed to #{@subreddit.name}!"
  end

  def unsubscribe
    m = current_user.memberships.where(subreddit_id: @subreddit.id).first
    m.destroy if m
  end

  def show
    @posts = @subreddit.posts
    @admins = @subreddit.moderators
  end

  def index

  end

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = current_user.subreddits.build(subreddit_params)
    if @subreddit.save
      m = @subreddit.memberships.first
      m.moderator = true
      if m.save
        redirect_to @subreddit, notice: "Subreddit successfully created."
      end
    end

  end


private
  def subreddit_params
    params.permit(:subreddit).require(:name, :description)
  end

  def set_subreddit
    @subreddit = Subreddit.find(params[:id])
  end
end




