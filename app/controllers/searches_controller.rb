class SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @value)
    @genres = Genre.all
  end

  private

  def search_for(how, value)
    case how
    when 'match'
      Product.where(genre_id: value)
    when 'partical'
    # joinsでテーブルを結合している。子テーブルの場合は複数形、親テーブルの場合は単数系で指定
    # カラムの指定はテーブル名で！
      Product.joins(:genre).where("genres.name LIKE ? OR products.name LIKE ? OR  products.description LIKE ?", "%#{value}%", "%#{value}%", "%#{value}%")
    end
  end
end
