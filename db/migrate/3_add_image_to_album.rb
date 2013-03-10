class AddImageToAlbum < ActiveRecord::Migration

  def self.up
    unless Refinery::Music::Album.column_names.map(&:to_sym).include?(:image_id)
      add_column Refinery::Music::Album.table_name, :title_image_id, :integer
    end
  end

  def self.down
    remove_column Refinery::Music::Album.table_name, :title_image_id
  end

end