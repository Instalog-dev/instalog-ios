#
# Be sure to run `pod lib lint Instalog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InstalogIOS'
  s.version          = '0.0.1'
  s.summary          = 'Powerful iOS SDK for crash reporting, event logging, and user feedback collection'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The Instalog iOS SDK provides comprehensive tools for iOS applications including automatic crash reporting, structured event logging, and user feedback collection. This SDK supports iOS 14+ and includes features like automatic device information collection, multiple log levels, and in-app feedback modals with screenshot support.
                       DESC

  s.homepage         = 'https://beta.instalog.dev'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zfinix' => 'chiziaruhoma@gmail.com' }
  s.source           = { :git => 'https://github.com/Instalog-dev/instalog-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'
  s.swift_version = '5.0'

  #s.source_files = 'InstalogIOS/Classes/**/*'
  s.preserve_paths   = 'InstalogIOS.xcframework', 'dSYM'
  s.vendored_frameworks = 'InstalogIOS.xcframework'
  s.static_framework = true

  # s.public_header_files = 'Pod/Classes/**/*.h'

  s.dependency 'PLCrashReporter', '1.11.2'
end