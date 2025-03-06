#
# Be sure to run `pod lib lint Instalog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InstalogIOS'
  s.version          = '1.0.0'
  s.summary          = 'A short description of Instalog.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The Instalog iOS SDK, for integrating Instalog into your iOS application. This SDK supports iOS 13+.
                       DESC

  s.homepage         = 'https://github.com/zfinix/Instalog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zfinix' => 'chiziaruhoma@gmail.com' }
  s.source           = { :git => 'https://github.com/instalog-dev/instalog-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'

  #s.source_files = 'InstalogIOS/Classes/**/*'
  s.preserve_paths   = 'InstalogIOS.xcframework', 'dSYM'
  s.vendored_frameworks = 'InstalogIOS.xcframework'
  s.static_framework = true

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'PLCrashReporter', '1.11.2'
end