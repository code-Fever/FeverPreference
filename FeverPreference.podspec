#
# Be sure to run `pod lib lint FeverPreference.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FeverPreference'
  s.version          = '1.0.0'
  s.summary          = '简单封装mmkv'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/code-Fever/FeverPreference'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Fever' => '450118418@qq.com' }
  s.source           = { :git => 'https://github.com/code-Fever/FeverPreference.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'FeverPreference/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FeverPreference' => ['FeverPreference/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MMKV'
end
