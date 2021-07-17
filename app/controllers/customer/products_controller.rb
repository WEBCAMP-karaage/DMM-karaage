class Customer::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(8).reverse_order
    @genres = Genre.all
  end

  def show
  end
end