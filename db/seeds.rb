# colors
Refinery::Music::MusicSetting.create(:name => "bg", :color => "E5E5E5", :description => "Background")
Refinery::Music::MusicSetting.create(:name => "leftbg", :color => "CCCCCC", :description => "Speaker icon/Volume control background")
Refinery::Music::MusicSetting.create(:name => "lefticon", :color => "333333", :description => "Speaker icon")
Refinery::Music::MusicSetting.create(:name => "voltrack", :color => "F2F2F2", :description => "Volume track")
Refinery::Music::MusicSetting.create(:name => "volslider", :color => "666666", :description => "Volume slider")
Refinery::Music::MusicSetting.create(:name => "rightbg", :color => "B4B4B4", :description => "Play/Pause button background")
Refinery::Music::MusicSetting.create(:name => "rightbghover", :color => "999999", :description => "Play/Pause button background (hover state)")
Refinery::Music::MusicSetting.create(:name => "righticon", :color => "333333", :description => "Play/Pause icon")
Refinery::Music::MusicSetting.create(:name => "righticonhover", :color => "FFFFFF", :description => "Play/Pause icon (hover state)")
Refinery::Music::MusicSetting.create(:name => "loader", :color => "009900", :description => "Loading bar")
Refinery::Music::MusicSetting.create(:name => "track", :color => "FFFFFF", :description => "Loading/Progress bar track backgrounds")
Refinery::Music::MusicSetting.create(:name => "tracker", :color => "DDDDDD", :description => "Progress track")
Refinery::Music::MusicSetting.create(:name => "border", :color => "CCCCCC", :description => "Progress bar border")
Refinery::Music::MusicSetting.create(:name => "skip", :color => "666666", :description => "Previous/Next skip buttons, only if you modify the plugin to build a playlist.")
Refinery::Music::MusicSetting.create(:name => "text", :color => "333333", :description => "Text")

# size
width = Refinery::Music::MusicSetting.create(:name => "width", :size => 290, :description => "Width of the player")

# Boolean
Refinery::Music::MusicSetting.create(:name => "autostart", :value => true, :description => "if true, player starts automatically")
Refinery::Music::MusicSetting.create(:name => "loop_track", :value => false, :description => "if true, player loops")
Refinery::Music::MusicSetting.create(:name => "animation", :value => false, :description => "if false, player is always open")
Refinery::Music::MusicSetting.create(:name => "remaining", :value => false, :description => "if true, shows remaining track time rather than ellapsed time")
Refinery::Music::MusicSetting.create(:name => "noinfo", :value => false, :description => "if true, disables the track information display")

Refinery::User.find(:all).each do |user|
  if user.plugins.find_by_name('music').nil?
    user.plugins.create(:name => 'music',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Refinery::Page.create(
  :title => 'Music',
  :link_url => '/music',
  :deletable => false,
 # :position => ((Refinery::Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/music(\/|\/.+?|)$'
)
#Refinery::Page.default_parts.each do |default_page_part|
#  page.parts.create(:title => default_page_part, :body => nil)
#end
