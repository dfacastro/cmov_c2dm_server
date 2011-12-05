class Property < ActiveRecord::Base
  
  KIND_TYPES = ["Apartment", "Home", "Castle"]
  
  validates :kind, inclusion: KIND_TYPES
    
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def self.kind_types
    KIND_TYPES
  end
  
end
