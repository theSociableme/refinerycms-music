
Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-music'
  s.version           = '3.0.0'
  s.summary           = 'Music engine for Refinery CMS'
  s.email             = "unixcharles@gmail.com, alexander.negoda@gmail.com"
  s.homepage          = "http://github.com/unixcharles/refinerycms-music"
  s.date              = '2011-08-25'
  s.license           = "MIT"
  s.authors           = "unixcharles, greendog"
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*', 'db/**/*']
end
