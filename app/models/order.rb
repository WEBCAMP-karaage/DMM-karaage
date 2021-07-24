class Order < ApplicationRecord
    # 支払い方法のenumの設定
    enum payment_method: {
        "クレジットカード": 0,
        "銀行振り込み": 1
    }

    belongs_to :customer
    # 注文商品テーブルとのアソシエーション
    has_many :order_products, dependent: :destroy

    def sum_order_produts
      self.order_products.all.sum(:quantity)
    end

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
    end

  # 支払い方法のバリデーション(0 or 1)
  validates :payment_method, inclusion: { in: Order.payment_methods.keys }

  # 注文ステータスのバリデーション(0~4)
  validates :order_status, inclusion: { in: Order.order_statuses.keys }

  # 正規表現を使ったバリデーション
  # 郵便番号のバリデーション
  VARID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, format: { with: VARID_POSTAL_CODE_REGEX }
end
