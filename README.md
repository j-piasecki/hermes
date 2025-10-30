# How to repro

```
IOS_DEPLOYMENT_TARGET="12.0" ./utils/build-ios-framework-rn.sh
MAC_DEPLOYMENT_TARGET=10.14 ./utils/build-mac-framework-rn.sh
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
  "js_numGCs": 110,
  "js_gcCPUTime": 0.123212,
  "js_gcTime": 0.122513582,
  "js_totalAllocatedBytes": 529867776,
  "js_allocatedBytes": 467166976,
  "js_heapSize": 411041792,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 411041792,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageFunction]' passed (0.795 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageMap]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 287,
  "js_gcCPUTime": 0.4482939999999999,
  "js_gcTime": 0.44727687400000005,
  "js_totalAllocatedBytes": 1249867776,
  "js_allocatedBytes": 1187166976,
  "js_heapSize": 1149239296,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 1149239296,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageMap]' passed (1.311 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageObject]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 110,
  "js_gcCPUTime": 0.11323,
  "js_gcTime": 0.11327434400000003,
  "js_totalAllocatedBytes": 529867776,
  "js_allocatedBytes": 467166976,
  "js_heapSize": 411041792,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 411041792,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageObject]' passed (0.671 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageSet]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 287,
  "js_gcCPUTime": 0.412303,
  "js_gcTime": 0.41129491099999993,
  "js_totalAllocatedBytes": 1249867776,
  "js_allocatedBytes": 1220638976,
  "js_heapSize": 1149239296,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 1149239296,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageSet]' passed (1.177 seconds).
Test Case '-[ApplePlatformsIntegrationTests testMemoryUsageString]' started.
{
  "js_VMExperiments": 0,
  "js_numGCs": 207,
  "js_gcCPUTime": 0.152697,
  "js_gcTime": 0.152069634,
  "js_totalAllocatedBytes": 929067768,
  "js_allocatedBytes": 586814208,
  "js_heapSize": 536870912,
  "js_mallocSizeEstimate": 0,
  "js_vaSize": 536870912,
  "js_externalBytes": 0,
  "js_markStackOverflows": 0
}
```