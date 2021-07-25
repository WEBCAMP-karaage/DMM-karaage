class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品を登録しました。"
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      flash.now[:danger] = "全ての項目を正しく入力してください。"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "商品情報を変更しました。"
      redirect_to admin_product_path(@product)
    else
      @genres = Genre.all
      flash.now[:danger] = "全ての項目を正しく入力してください。"
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :genre_id, :non_taxed_price, :sales_status)
  end

end
