class AddImageToAlbum < ActiveRecord::Migration

  def self.up
    unless Refinery::Album.column_names.map(&:to_sym).include?(:image_id)
      add_column Refinery::Album.table_name, :title_image_id, :integer
    end
  end

  def self.down
    remove_column Refinery::Album.table_name, :title_image_id
  end

end