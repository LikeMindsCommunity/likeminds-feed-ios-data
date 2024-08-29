Pod::Spec.new do |spec|
  spec.name         = "LikeMindsFeed"
  spec.version      = "1.10.0"
  spec.summary      = "Data Layer for LikeMindsFeed"
  spec.homepage     = "https://docs.likeminds.community/feed/category/data"

  spec.license = { 
    :type => 'Copyright', 
    :text => <<-LICENSE
      Copyright 2023
      Permission is granted to...
    LICENSE
  }

  spec.author = { 
    "Pushpendra Singh" => "pushpendra.singh@likeminds.community",
    "Devansh Mohata" => "devansh.mohata@likeminds.community"
  }
  
  spec.ios.deployment_target = "13.0"

  spec.source = { 
    :git => "https://github.com/LikeMindsCommunity/likeminds-feed-iOS-data-xc.git", 
    :tag => spec.version 
  }
  
  spec.vendored_frameworks = "LikeMindsFeed.xcframework"
  spec.swift_version = "5"
  
  spec.framework = "Foundation"
  spec.dependency "Alamofire", '~> 5.7.1'
end
