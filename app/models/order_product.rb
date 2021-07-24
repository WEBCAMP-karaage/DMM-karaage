class OrderProduct < ApplicationRecord
  # 注文テーブルと商品テーブルのアソシエーション
  belongs_to :order
  belongs_to :product
  enum product_status: {
    製作不可: 0,
    製作待ち: 1,
    製作中: 2,
    製作完了: 3
  }

  with_options presence: true do
   validates :order_id
   validates :product_id
   validates :quantity
  end

  # 制作制作ステータスのバリデーション
  validates :product_status, inclusion: { in: OrderProduct.product_statuses.keys }, allow_blank: true

end
