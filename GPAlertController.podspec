Pod::Spec.new do |s|

  s.platform        = :ios
  s.ios.deployment_target = '10.0'
  s.name         = "GPAlertController"
  s.summary      = "A pod for custom alert controllers."
  s.description  = <<-DESC
A pod for custom alert controllers. I'll update this in a bit.
                   DESC
  s.version      = "0.0.3"
  s.license         = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author          = { "Gabriele Pregadio" => "sentiinex@gmail.com" }
  s.homepage        = "https://github.com/sentiinex/GPAlertController"
  s.source        = { :git => "https://github.com/sentiinex/GPAlertController.git", :tag => "#{s.version}" }
  s.framework  = "UIKit"
  s.source_files  = "GPAlertController/**/*.{swift}"
  s.resources = "GPAlertController/**/*.{xib}"
end
