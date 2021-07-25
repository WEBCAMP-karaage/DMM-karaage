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
      genre_id = Genre.find_by(name: value).id
      Product.where("genre_id LIKE ?", "%#{genre_id}%").or(Product.where("name LIKE ?", "%#{value}%")).or(Product.where("description LIKE ?", "%#{value}%"))
    end
  end
end
