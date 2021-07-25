class Product < ApplicationRecord
    attachment :image, destroy: false

    has_many :cart_products, dependent: :destroy

    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy

    belongs_to :genre
    #税込み
    def  add_tax_price
      (self.non_taxed_price * 1.10).round
    end

    with_options presence: true do
     validates :genre_id
     validates :name
     validates :description
     validates :non_taxed_price
     validates :image
    end

     validates :sales_status, inclusion: { in: [true, false] }

end
