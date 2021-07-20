class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @product = Product.new
    @genres = Genre.all
    #@genres.first
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product), notice: "商品を登録しました。"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :non_taxed_price, :sales_status)
  end
end
