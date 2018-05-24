class ProductsController < ApplicationController

  def index
    @products = Product.where(published: nil)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end
  
  def create
    product_params = params.require(:product).permit( :title, :description, :price, :published, :category_id)
    @product = Product.new(product_params)
    @categories = Category.all
    if @product.save
      redirect_to products_url
    else 
      render :new 
    end
  end
end