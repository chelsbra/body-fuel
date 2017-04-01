class Product < ApplicationRecord
  belongs_to :type
  validates :name, :price, :description, presence: true 

  mount_uploader :image, ImageUploader  
  
  def self.keyword_search(keywords)
  		keywords = "%" + keywords + "%"
  		Product.where("name LIKE ? OR description LIKE ?", keywords, keywords)
  end
end
