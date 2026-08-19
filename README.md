# LikeMinds Feed data layer for iOS

The Swift data layer behind the LikeMinds Feed SDK. Auth, networking, media upload and the full feed
API surface.

[![CocoaPods](https://img.shields.io/cocoapods/v/LikeMindsFeed.svg)](https://cocoapods.org/pods/LikeMindsFeed)
[![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](LICENSE)

**Docs:** https://docs.likeminds.io/

## Install

```ruby
pod 'LikeMindsFeed', '~> 1.12.0'
```

Note the published pod vendors the prebuilt binary from
[likeminds-feed-ios-data-xc](https://github.com/LikeMindsCommunity/likeminds-feed-ios-data-xc)
rather than compiling this source.

## What it gives you

`LMFeedClient`, covering posts, comments, likes, polls, topics, notifications, moderation, members
and feedrooms.

Deliberately thin: **Alamofire only**. No local database and no Firebase at this layer, unlike the
Chat data layer, which carries a full offline sync engine. Feed caching lives in the UI SDK.

You can use this on its own to build your own feed UI. If you want screens too, use the
[UI SDK](https://github.com/LikeMindsCommunity/likeminds-feed-ios), which depends on this.

## Requirements

iOS 13.0+ · Swift 5 · CocoaPods only

## Contributing

See the org-wide [contributing guide](https://github.com/LikeMindsCommunity/.github/blob/master/.github/CONTRIBUTING.md).
Security issues go to **hi@likeminds.community**, not the issue tracker.

## License

Apache 2.0. See [LICENSE](LICENSE).
