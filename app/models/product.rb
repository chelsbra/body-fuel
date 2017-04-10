class Product < ApplicationRecord
  belongs_to :type
  has_many :order_items
  validates :name, :price, :description, :type_id, presence: true 

  mount_uploader :image, ImageUploader  
  
  scope :high_protein, -> (type_id) { where("type_id = ?", type_id) if type_id.present? }
 
  scope :keywords, -> (keywords) { where("name LIKE ?", "%#{keywords}%") }

  # scope :low_carb, -> {where('type_id = 2')}
  # scope :high_carb, -> {where('type_id = 3')}
 

 #  def self.keyword_search(type, keywords)
 #  		keywords = "%" + keywords + "%"
 #  		type = "%" + type + "%"

 #  		Product.where(["name LIKE ? OR type_id = ?", keywords, type]) if keywords.present?
  		
	# end
end
