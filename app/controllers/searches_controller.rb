class SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    @datas = search_for(@how, @value)
    @genres = Genre.all
    @genre = Genre.find(@value)
  end

  private

  def search_for(how, value)
    case how
    when 'match'
      Product.where(genre_id: value)
    end
  end
end
