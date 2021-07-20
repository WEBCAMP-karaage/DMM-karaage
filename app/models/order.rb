class Order < ApplicationRecord
    # 支払い方法のenumの設定
    enum payment_method: {
        "クレジットカード": 0,
        "銀行振り込み": 1
    }
    
    belongs_to :customer
    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy
    enum order_status: { 
        "入金待ち": 0,
        "入金確認": 1, 
        "制作中": 2, 
        "発送準備": 3,
        "発送済み": 4
    }
end
