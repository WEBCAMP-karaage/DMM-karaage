class Order < ApplicationRecord
    # 支払い方法のenumの設定
    enum payment_method: {
        card: 0,
        transfer: 1
    }

    belongs_to :customer
    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy
    enum product_status: { 着手不可: 0, 制作待ち: 1, 制作中: 2, 制作完了: 3 }

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
