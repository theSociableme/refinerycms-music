class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :refinery_albums do |t|
      t.string :title
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :refinery_albums
  end
end