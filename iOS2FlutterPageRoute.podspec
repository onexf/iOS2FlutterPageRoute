#
# Be sure to run `pod lib lint iOS2FlutterPageRoute.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'iOS2FlutterPageRoute'
  s.version          = '0.1.2'
  s.summary          = 'iOS原生和Flutter页面之间跳转'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'iOS原生项目进行Flutter混编原生页面和Flutter页面互相跳转的一个思路'

  s.homepage         = 'https://github.com/onexf/iOS2FlutterPageRoute'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'onexf' => '630850673@qq.com' }
  s.source           = { :git => 'https://github.com/onexf/iOS2FlutterPageRoute.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'iOS2FlutterPageRoute/Classes/**/*'
  
  # s.resource_bundles = {
  #   'iOS2FlutterPageRoute' => ['iOS2FlutterPageRoute/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Flutter'
  
end
