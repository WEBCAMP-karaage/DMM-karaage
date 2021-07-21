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
end
