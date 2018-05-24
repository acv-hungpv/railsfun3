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
    @product = Product.new(product_params)
    @categories = Category.all
    # if @product.save
    #   # redirect_to products_url
    #   flash[:notice] = 'successfully'
    #   redirect_to products_url

    # else 
    #   flash.now[:notice] = 'Error'
    #   render :new 
    # end
    return redirect_to products_url, notice: 'you have successfully create product' if @product.save
    flash.now[:notice] = 'There is an error in your form'
    render :new
  end

  private

  def product_params
    product_params = params.require(:product).permit( :title, :description, :price, :published, :category_id, :country)
  end
end