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
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageFunction]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 62,
  "js_gcCPUTime": 0.09800000000000007,
  "js_gcTime": 0.09700000000000007,
  "js_totalAllocatedBytes": 220438448,
  "js_allocatedBytes": 220177152,
  "js_heapSize": 230686720,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 230686720,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageFunction]' passed (0.978 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageMap]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 183,
  "js_gcCPUTime": 0.3140000000000002,
  "js_gcTime": 0.3170000000000002,
  "js_totalAllocatedBytes": 700438640,
  "js_allocatedBytes": 700210104,
  "js_heapSize": 721420288,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 721420288,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageMap]' passed (1.582 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageObject]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 62,
  "js_gcCPUTime": 0.08500000000000006,
  "js_gcTime": 0.08400000000000006,
  "js_totalAllocatedBytes": 220438448,
  "js_allocatedBytes": 220177152,
  "js_heapSize": 230686720,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 230686720,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageObject]' passed (0.926 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageSet]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 183,
  "js_gcCPUTime": 0.3100000000000002,
  "js_gcTime": 0.3110000000000002,
  "js_totalAllocatedBytes": 700438640,
  "js_allocatedBytes": 700210104,
  "js_heapSize": 721420288,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 721420288,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageSet]' passed (1.511 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageString]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 171,
  "js_gcCPUTime": 0.03400000000000002,
  "js_gcTime": 0.03400000000000002,
  "js_totalAllocatedBytes": 659638416,
  "js_allocatedBytes": 500224808,
  "js_heapSize": 515899392,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 515899392,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
```