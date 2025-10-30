# How to repro

```
IOS_DEPLOYMENT_TARGET="12.0" ./utils/build-ios-framework.sh
MAC_DEPLOYMENT_TARGET=10.14 ./utils/build-mac-framework.sh
cd test/ApplePlatformsIntegrationTestApp
pod install

xcodebuild test \
    -workspace ApplePlatformsIntegrationTests.xcworkspace \
    -configuration Debug \
    -destination 'platform=iOS Simulator,name=iPhone 16' \
    -scheme ApplePlatformsIntegrationMobileTests
```

Result:
```
Test Suite 'All tests' passed at 2025-10-30 11:46:01.155.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.097 (0.099) seconds
```