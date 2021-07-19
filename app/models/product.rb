class Product < ApplicationRecord
    attachment :image, destroy: false
    
    
    
    has_many :cart_products, dependent: :destroy

    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy

end
