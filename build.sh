
# 1
xcodebuild archive \
-workspace LikeMindsFeed.xcworkspace \
-scheme LikeMindsFeed \
-configuration Release \
-sdk iphoneos \
-archivePath archives/ios_devices.xcarchive \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
SKIP_INSTALL=NO \

# 2
xcodebuild archive \
-workspace LikeMindsFeed.xcworkspace \
-scheme LikeMindsFeed \
-configuration Debug \
-sdk iphonesimulator \
-archivePath archives/ios_simulators.xcarchive \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
SKIP_INSTALL=NO \

# 3
xcodebuild \
-create-xcframework \
-framework archives/ios_devices.xcarchive/Products/Library/Frameworks/LikeMindsFeed.framework \
-framework archives/ios_simulators.xcarchive/Products/Library/Frameworks/LikeMindsFeed.framework \
-output LikeMindsFeed.xcframework
