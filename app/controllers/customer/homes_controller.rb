class  Customer::HomesController < ApplicationController
  def top
    @products = Product.page(params[:page]).per(4).reverse_order
    @genres = Genre.all
  end

  def about
  end
end
