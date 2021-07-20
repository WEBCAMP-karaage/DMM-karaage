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
   

    with_options presence: true do
      validates :customer_id
      validates :shipping_cost
      validates :total_price
      validates :payment_method
      validates :name
      validates :address
      validates :postal_code
      validates :order_status
    end
end
