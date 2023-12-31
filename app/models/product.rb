class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  # validates :price, presence: true
  # validates :price, numericality: { greater_than: 0 }
  # below shows the combined validation of presence and numericality
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  # validates :description, length: { minimum: 10, maximum: 500 }
  # below shows the more commonly used validation
  validates :description, length: { in: 10..1000 }

  #commented out the image_url reference since we're building out an image table - keeping the code for reference
  # validates_format_of :image_url, :with => %r{\.(jpg|png|jpeg)$}i, :message => "only allows specific formats", multiline: true

  # def supplier
  #   supplier = Supplier.find_by(id: supplier_id)
  #   return supplier
  # end

  # shortcut to the above
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

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
