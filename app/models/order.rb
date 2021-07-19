class Order < ApplicationRecord
    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy

    # 支払い方法のenumの設定
    enum payment_method: {
        card: 0,
        transfer: 1
    }
end
