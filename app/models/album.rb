class Album < ActiveRecord::Base
  
  has_many :songs
  named_scope :published, :conditions => {:published => true}, :order => :position
  accepts_nested_attributes_for :songs
 
 
end
