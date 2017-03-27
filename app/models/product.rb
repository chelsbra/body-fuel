class Product < ApplicationRecord
  belongs_to :type
  validates :name, :price, :description, presence: true 

  def self.keyword_search(keywords)
  		keywords = "%" + keywords + "%"
  		Product.where("name LIKE ? OR description LIKE ?", keywords)
  end
end
