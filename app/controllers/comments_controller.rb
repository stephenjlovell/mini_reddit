class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.hash_tree
  end
 
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(parent_id: params[:parent_id], user_id: current_user.id)
  end
     
  def create
    @post = Post.find(params[:post_id])
    create_params = comment_params.merge({user_id: current_user.id, votes: 0})

    if create_params[:parent_id].to_i > 0
      parent = Comment.find_by_id(create_params.delete(:parent_id))
      @comment = parent.children.build(create_params)
    else
      @comment = Comment.new(create_params)
    end


    if @comment.save
      flash[:success] = "Your comment was successfully added: #{@comment.inspect}"
      redirect_to post_path(@post)
    else
      flash[:failure] = 'Your comment was not saved.'
      render 'new'
    end
  end

private
 
  def comment_params
    params.require(:comment).permit(:text, :post_id, :parent_id)
  end


end
