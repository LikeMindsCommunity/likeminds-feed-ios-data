Pod::Spec.new do |spec|
  spec.name         = "LikeMindsFeed"
  spec.version      = "1.8.0"
  spec.summary      = "LikeMindsFeed"
  spec.homepage     = "https://github.com/pushpendralike/LikeMinds-iOS-Feed-SDK"

  spec.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2023
                   Permission is granted to...
                  LICENSE
                }

  spec.author             = { "pushpendrasingh" => "pushpendra.singh@likeminds.community" }
  
  spec.ios.deployment_target = "13.0"

  spec.source       = { :git => "https://github.com/pushpendralike/LikeMinds-iOS-Feed-SDK.git", :tag => "#{spec.version}" }
  # spec.vendored_frameworks = "LikeMindsFeed.xcframework"
  spec.source_files = 'LikeMindsFeed/**/*.swift'
  spec.swift_version = "5"

  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  spec.framework  = "Foundation"
  spec.dependency "Alamofire", '~> 5.7.1'
end
