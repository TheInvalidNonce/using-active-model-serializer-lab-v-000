class ProductsController < ApplicationController
  def index
    @products = Product.all
    
  end

  # def inventory
  #   product = Product.find(params[:id])
  #   render plain: product.inventory > 0 ? true : false
  # end

  # def description
  #   product = Product.find(params[:id])
  #   render plain: product.description
  # end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
    # Adding respond to allows show to work with html and the json route to display the data with js
    respond_to do |format|
       format.html { render :show }
       format.json { render json: @product, status: 200 }
     end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
