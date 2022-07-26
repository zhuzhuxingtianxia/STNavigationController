#
# Be sure to run `pod lib lint STNavigationController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'STNavigationController'
  s.version          = '4.5.0'
  s.summary          = 'STNavigationController. 使每个视图控制器都有自己的导航栏'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/zhuzhuxingtianxia/STNavigationController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhuzhuxingtianxia' => '873391579@qq.com' }
  s.source           = { :git => 'https://github.com/zhuzhuxingtianxia/STNavigationController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.swift_version = '5.0'
  
  s.default_subspec  = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'STNavigationController/Classes/**/*'
  end
  
#  s.source_files = 'STNavigationController/Classes/**/*'
  
   s.resource_bundles = {
     'STNavigationController' => ['STNavigationController/Assets/*.png']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
