class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :delete]
  before_action :set_categories, only: [:new, :edit]
  before_action :set_prod_comments, only: [:show]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      flash[:errors] = product.errors.full_messages
      render :new
    end
  end

  def show
    @comment = @product.comments.build
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      flash[:errors] = @product.errors.full_messages
      render :edit
    end
  end

  def delete
    @product.destroy
    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
  def set_categories
    @categories = Category.all
  end
  def set_prod_comments
    @prod_comments = Product.find(params[:id]).comments.order('created_at desc')
  end
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
end
