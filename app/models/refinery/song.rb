module Refinery
  class Song < ActiveRecord::Base
    acts_as_indexed :fields => [:title, :description],
                    :index_file => [Rails.root.to_s, "tmp", "index"]

    scope :published, :conditions => {:published => true}, :order => :position

    belongs_to :resource
    belongs_to :album
    validates_presence_of :title
    # validates_uniqueness_of :title
  end
end
