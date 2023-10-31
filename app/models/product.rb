class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  # validates :description, length: { minimum: 10, maximum: 500 }
  validates :description, length: { in: 10..500 }
  # validates :image_url, format: { with: jpg, png, jpeg, psd, message: "only allows specific formats" }

  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    tax = price * 0.09
    tax
  end

  def total
    total = price + tax
    total
  end
end
