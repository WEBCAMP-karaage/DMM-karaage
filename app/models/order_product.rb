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
    :order_id
    :product_id
    :quantity
    :product_status
    :order_status
  end

  # 制作制作ステータスのバリデーション
  validates :product_status, inclusion: { in: (0..3) }

end
