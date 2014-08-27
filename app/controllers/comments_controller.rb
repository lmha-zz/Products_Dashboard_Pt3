class CommentsController < ApplicationController
  before_action :set_product, only: [:create]
  def index
    @comments = Comment.all.order('created_at desc')
  end

  def create
    @comment = @product.comments.build(comment_params)
    if @comment.save
      redirect_to product_path(params[:product_id].to_i)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to product_path(@product)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
  def set_product
    @product = Product.find(params[:product_id])
  end
end
