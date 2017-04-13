class Province < ApplicationRecord
	has_many :users

	validates :gst_rate,  :allow_nil => true, 
   					 	  :numericality => { :greater_than_or_equal_to => 0 }
   					 
   	validates :hst_rate,  :allow_nil => true,
	   					  :numericality => { :greater_than_or_equal_to => 0 }
 
   	validates :pst_rate,  :allow_nil => true,
	      				  :numericality => { :greater_than_or_equal_to => 0 } 
end
