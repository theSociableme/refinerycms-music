module SongsHelper
  def player(music)
    flashvar = []

    # colors
    flashvar << "bg=#{Refinery::MusicSetting.bg}" unless Refinery::MusicSetting.bg == 'E5E5E5'
    flashvar << "leftbg=#{Refinery::MusicSetting.bg}" unless Refinery::MusicSetting.leftbg == 'CCCCCC'
    flashvar << "lefticon=#{Refinery::MusicSetting.lefticon}" unless Refinery::MusicSetting.lefticon == '333333'
    flashvar << "voltrack=#{Refinery::MusicSetting.voltrack}" unless Refinery::MusicSetting.voltrack == 'F2F2F2'
    flashvar << "volslider=#{Refinery::MusicSetting.volslider}" unless Refinery::MusicSetting.volslider == '666666'
    flashvar << "rightbg=#{Refinery::MusicSetting.rightbg}" unless Refinery::MusicSetting.rightbg == 'B4B4B4'
    flashvar << "rightbghover=#{Refinery::MusicSetting.rightbghover}" unless Refinery::MusicSetting.rightbghover == '999999'
    flashvar << "righticon=#{Refinery::MusicSetting.righticon}" unless Refinery::MusicSetting.righticon == '333333'
    flashvar << "righticonhover=#{Refinery::MusicSetting.righticonhover}" unless Refinery::MusicSetting.righticonhover == 'FFFFFF'
    flashvar << "righticonhover=#{Refinery::MusicSetting.righticonhover}" unless Refinery::MusicSetting.righticonhover == 'FFFFFF'
    flashvar << "loader=#{Refinery::MusicSetting.loader}" unless Refinery::MusicSetting.loader == '009900'
    flashvar << "track=#{Refinery::MusicSetting.track}" unless Refinery::MusicSetting.track == 'FFFFFF'
    flashvar << "tracker=#{Refinery::MusicSetting.tracker}" unless Refinery::MusicSetting.tracker == 'DDDDDD'
    flashvar << "border=#{Refinery::MusicSetting.border}" unless Refinery::MusicSetting.border == 'CCCCCC'
    flashvar << "skip=#{Refinery::MusicSetting.skip}" unless Refinery::MusicSetting.skip == '666666'
    flashvar << "text=#{Refinery::MusicSetting.text}" unless Refinery::MusicSetting.text == '333333'
    # Boolean
    flashvar << "autostart=yes" if Refinery::MusicSetting.autostart == true
    flashvar << "loop=yes" if Refinery::MusicSetting.loop_track == true
    flashvar << "animation=no" if Refinery::MusicSetting.animation == false
    flashvar << "remaining=yes" if Refinery::MusicSetting.remaining == true
    flashvar << "noinfo=yes" if Refinery::MusicSetting.noinfo == true
    # size
    flashvar << "width=#{Refinery::MusicSetting.width}"

    if music.respond_to? :each
      artists = []
      titles = []
      files = []
      music.each do |song|
        if song.resource
          artists << song.title
          titles << song.artist
          files << song.resource.url
        end
      end
      flashvar << "titles=#{CGI::escape titles.join(',')}"
      flashvar << "artists=#{CGI::escape artists.join(',')}"
      flashvar << "soundFile=#{CGI::escape files.join(',')}"
    else
      # file info
      flashvar << "titles=#{CGI::escape(music.title)}"
      flashvar << "artists=#{CGI::escape(music.artist)}"
      flashvar << "soundFile=#{CGI::escape(music.resource.url)}"
    end


    raw <<-EOF
  <object type="application/x-shockwave-flash" data="/player.swf" height="84px" width="#{Refinery::MusicSetting.width}">
    <param name="movie" value="/player.swf" />
    <param name="FlashVars" value="#{flashvar.join('&')}" />
    <param name="quality" value="high" />
    <param name="menu" value="true" />
    <param name="wmode" value="transparent" />
  </object>
    EOF
  end
end
