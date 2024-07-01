Pod::Spec.new do |spec|
  spec.name         = "LikeMindsFeed"
  spec.version      = "1.7.3"
  spec.summary      = "Data Layer for LikeMindsFeed"
  spec.homepage     = "https://docs.likeminds.community/feed/category/data"

  spec.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2023
                   Permission is granted to...
                  LICENSE
                }

  spec.author = { "pushpendrasingh" => "pushpendra.singh@likeminds.community" }
  
  spec.ios.deployment_target = "13.0"

  spec.source       = { :git => "https://github.com/LikeMindsCommunity/likeminds-feed-iOS-data-xc.git", :tag => spec.version }
  spec.vendored_frameworks = "LikeMindsFeed.xcframework"
  spec.swift_version = "5"

  spec.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  spec.framework  = "Foundation"
  spec.dependency "Alamofire", '~> 5.7.1'
end
