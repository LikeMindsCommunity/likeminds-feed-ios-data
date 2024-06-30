# 1
run_pre_build_script() {
    ./setup.sh

    if [ $? -ne 0 ]; then
        echo "Pre-build script failed. Exiting."
        exit 1
    fi
}

run_pre_build_script

# 2
xcodebuild archive \
-workspace LikeMindsFeed.xcworkspace \
-scheme LikeMindsFeed \
-configuration Release \
-sdk iphoneos \
-archivePath LMFeedFramework/archives/ios_devices.xcarchive \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
SKIP_INSTALL=NO \

# 3
xcodebuild archive \
-workspace LikeMindsFeed.xcworkspace \
-scheme LikeMindsFeed \
-configuration Debug \
-sdk iphonesimulator \
-archivePath LMFeedFramework/archives/ios_simulators.xcarchive \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
SKIP_INSTALL=NO \

# 4
xcodebuild \
-create-xcframework \
-framework LMFeedFramework/archives/ios_devices.xcarchive/Products/Library/Frameworks/LikeMindsFeed.framework \
-framework LMFeedFramework/archives/ios_simulators.xcarchive/Products/Library/Frameworks/LikeMindsFeed.framework \
-output LMFeedFramework/LikeMindsFeed.xcframework
