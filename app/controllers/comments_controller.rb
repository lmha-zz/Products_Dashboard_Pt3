class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order('created_at desc')
  end

  def create
    @comment = Product.find(params[:product_id].to_i).comments.build(comment_params)
    if @comment.save
      redirect_to product_path(params[:product_id].to_i)
    else
      flash[:errors] = @comment.errors.full_messages
      render template: "products/"+params[:product_id]
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  def prod_id
    params.require(:product_id).to_i
  end

end
