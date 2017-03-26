class Product < ApplicationRecord
  belongs_to :type

 validates :name, :price, :description, presence: true 
end
