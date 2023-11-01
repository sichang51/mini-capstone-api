class Supplier < ApplicationRecord
  #where means it applies to all
  # def products
  #   products = Product.where(supplier_id: id)
  #   return products
  # end

  # shortcut to the above
  has_many :products
end
