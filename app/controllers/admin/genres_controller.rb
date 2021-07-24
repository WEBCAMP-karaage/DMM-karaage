class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "新規ジャンルを追加しました。"
      redirect_to admin_genres_path
    else
      flash.now[:danger] = "ジャンル名を入力してください。"
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:success] = "ジャンルを更新しました。"
      redirect_to admin_genres_path
    else
      flash.now[:danger] = "ジャンル名を入力してください。"
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
