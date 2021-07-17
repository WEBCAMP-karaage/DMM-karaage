class Product < ApplicationRecord
    attachment :image, destroy: false
end
