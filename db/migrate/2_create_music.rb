class CreateMusic < ActiveRecord::Migration

  def self.up

    create_table :refinery_music_songs do |t|
      t.string :title
      t.string :artist
      t.text :description
      t.boolean :published, :default => true
      t.boolean :show_download_link, :default => true
      t.integer :resource_id
      t.integer :position
      t.integer :album_id

      t.timestamps
    end
    
    add_index :refinery_music_songs, :id
    add_index :refinery_music_songs, [:id, :published]

    create_table :refinery_music_music_settings do |t|
      t.string   :name
      t.boolean  :value
      t.string   :color
      t.integer   :size
      t.string   :description
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
    
    add_index :refinery_music_music_settings, :id
    add_index :refinery_music_music_settings, :name

  #  load(Rails.root.join('db', 'seeds', 'music.rb'))
  end

  def self.down
    Refinery::UserPlugin.destroy_all({:name => "music"})

    Refinery::Page.delete_all({:link_url => "/music"})

    drop_table :refinery_music_songs
    drop_table :refinery_music_music_settings
  end

end
