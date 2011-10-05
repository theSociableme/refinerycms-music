class Album < ActiveRecord::Base
 
  belongs_to :title_image, :class_name => 'Image'
  has_many :songs
  accepts_nested_attributes_for :songs
  validates_presence_of :title
  
end
