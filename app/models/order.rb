class Order < ApplicationRecord
    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy
end
