class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to products_path
    else
      flash[:errors] = product.errors.full_messages
      render :new
    end
  end

  def show
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

  def destroy
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
