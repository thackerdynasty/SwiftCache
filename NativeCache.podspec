Pod::Spec.new do |s|
  s.name             = 'NativeCache'
  s.version          = '1.0.4'
  s.summary          = 'An alternative to NSCache for swift!.'
  s.homepage         = 'https://github.com/thackerdynasty/SwiftCache'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'Quick Bird' => 'mascot@quickbirdstudios.com' }
  s.source           = { :git => 'https://github.com/thackerdynasty/SwiftCache.git', :tag => s.version.to_s }
  s.swift_version = '6.0'
  s.ios.deployment_target = '16.0'
  s.macos.deployment_target = '13.0'
  s.source_files = 'Sources/SwiftCache/**/*'
end
