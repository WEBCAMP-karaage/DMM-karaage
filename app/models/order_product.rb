class OrderProduct < ApplicationRecord
  # 注文テーブルと商品テーブルのアソシエーション
  belongs_to :order
  belongs_to :product
  
end
