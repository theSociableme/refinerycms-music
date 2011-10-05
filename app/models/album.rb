class Album < ActiveRecord::Base
  
  has_many :songs
  accepts_nested_attributes_for :songs
  validates_presence_of :title
  has_one :image
  accepts_nested_attributes_for :image, :allow_destroy => false
 
end
