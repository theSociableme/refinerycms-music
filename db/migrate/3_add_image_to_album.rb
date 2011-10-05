class AddImageIdToAlbums < ActiveRecord::Migration

  def self.up
    unless ::Album.column_names.map(&:to_sym).include?(:image_id)
      add_column ::Album.table_name, :title_image_id, :integer
    end
  end

  def self.down
    remove_column ::Album.table_name, :title_image_id
  end

end