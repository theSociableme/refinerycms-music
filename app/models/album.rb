class Album < ActiveRecord::Base
  
  has_many :songs
  accepts_nested_attributes_for :songs
  validates_presence_of :title
 
end
