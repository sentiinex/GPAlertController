#
#  Be sure to run `pod spec lint GPAlertController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "GPAlertController"
  s.version      = "0.0.1"
  s.summary      = "A pod for custom alert controllers."
  s.description  = <<-DESC
                   DESC
  s.homepage        = "https://github.com/sentiinex/GPAlertController"
  # s.screenshots   = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license         = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author          = { "Gabriele Pregadio" => "sentiinex@gmail.com" }
  # s.social_media_url = "http://twitter.com/Gabe"
  s.platform        = :ios

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source        = { :git => "https://github.com/sentiinex/GPAlertController.git", :tag => "#{s.version}" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
