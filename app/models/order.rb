class Order < ApplicationRecord
    belongs_to :customer
    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy
    enum product_status: { 着手不可: 0, 制作待ち: 1, 制作中: 2, 制作完了: 3 }
end
