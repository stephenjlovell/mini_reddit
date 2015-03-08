class CommentsController < ApplicationController
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
    @comment = current_user.comments.build(comment_params)

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
