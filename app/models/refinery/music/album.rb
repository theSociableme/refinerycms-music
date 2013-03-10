module Refinery
  module Music

    class Album < ActiveRecord::Base
      attr_accessible :title, :title_image_id, :position
      belongs_to :title_image, :class_name => 'Image'
      has_many :songs
      accepts_nested_attributes_for :songs
      validates_presence_of :title
    end
  end
end
