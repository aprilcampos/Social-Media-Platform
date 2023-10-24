class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      # Handle validation errors
      render 'posts/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post, notice: 'Comment was successfully deleted.'
  end  

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
