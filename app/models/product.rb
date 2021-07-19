class Product < ApplicationRecord
    attachment :image, destroy: false

    has_many :cart_products, dependent: :destroy

    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy

    #税込み
    def  add_tax_price
      (self.non_taxed_price * 1.10).round
    end


end
